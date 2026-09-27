# ITSM Incident Event Log — SQL Case Study

## Project Overview

This project analyzes the ServiceNow Incident Event Log dataset — a real-world IT Service
Management (ITSM) dataset capturing the full lifecycle of IT incidents, including state
transitions, SLA compliance, assignment history, and resolution timelines.

- **Dataset:** `incident_event_log.csv`
- **Rows:** 141,712
- **Unique incidents:** 24,918 (each incident has multiple rows — one per state-change/update event)
- **Columns:** 36
- **Tools used:** Microsoft Excel (initial preprocessing), Google BigQuery (SQL-based cleaning and transformation)

Before the analysis, the raw dataset needed cleaning. Below is every step taken, the issues
encountered, and how each was resolved — since data cleaning decisions materially affect the
validity of downstream analysis.

## Folder structure

```
ITSM Incident Event Log project/
├── README.md              <- this file (project overview + data cleaning steps)
├── SQL Queries/            <- one .sql file per analysis question
└── Insights/                <- one .md file per analysis question, with output + findings
```
## Key Findings (TL;DR)

- **SLA compliance is a real problem:** Only 63.42% of incidents (15,803 of 24,918) met their SLA — about 1 in 3 incidents breach their deadline.
- **Priority classification is inconsistent with actual urgency:** High (99.51%) and Critical (98.15%) priority incidents breach SLA almost every time, while Low priority breaches only 15.89%. Critical incidents also take *longer* to resolve on average (265.62 hrs) than Moderate (173.94 hrs) and High (151.97 hrs) — suggesting tight deadlines for urgent tickets aren't being met despite faster-than-average handling.
- **Massive team performance gap:** Best-performing team (Group 64) breaches only 10.89% of SLAs; worst-performing team (Group 10) breaches 74.93% — nearly 7x worse, despite handling similar ticket volumes. This points to a team-specific issue (staffing/process), not a company-wide one.
- **Incident volume is heavily front-loaded:** 90%+ of all incidents occurred in just 3 months (March–May 2016), then dropped to single/double digits per month for the rest of the dataset — worth investigating with ops teams as a likely one-off event or major system rollout.
- **A handful of categories drive most incidents and most delay:** Just 5 of 50+ categories account for ~55% of all incident volume. Separately, Category 34 has by far the worst average resolution time (1,325.84 hrs / ~55 days) — nearly 2x the next-worst category — flagging a likely structural bottleneck (vendor dependency, hardware procurement, etc.).
- **Nearly half of all incidents are misrouted initially:** 45.63% of incidents required at least one reassignment before resolution, pointing to a gap in initial ticket categorization/routing.
- **Fix quality is strong once resolved:** Only 1.1% of incidents were ever reopened — and reopen rate is unrelated to resolution speed (the slowest categories aren't the ones getting reopened), meaning these are two distinct problems requiring separate fixes.
- **Reporting channel is almost entirely phone-based:** 99.1% of incidents come through phone contact, with self-service and other digital channels seeing negligible adoption — a potential digital-transformation opportunity.
---

## Data Cleaning — Step by Step

### Step 1: Replacing Placeholder Values with True NULLs

The raw dataset used the string `"?"` as a placeholder for missing values across most columns
(e.g., `cmdb_ci`, `assigned_to`, `problem_id`, `vendor`).

**Initial attempt (Excel):** Used Find & Replace to swap `?` → `NULL`.

**Issue discovered:** Excel's Find & Replace treats `?` as a wildcard character matching any
single character — not a literal question mark. Even with "Match entire cell contents" enabled,
this meant every cell containing exactly one character (e.g., numeric fields like
`reassignment_count = 0`, `reopen_count = 0`) was also replaced with NULL, silently destroying
legitimate data. A verification pass showed:

- `reopen_count`: 100% of values changed to NULL
- `reassignment_count`: ~99.4% of values changed to NULL
- `sys_mod_count`: ~85.7% of values changed to NULL

**Fix:** Escaped the wildcard using a tilde (`~?`) in Find & Replace, which forces Excel to treat
`?` as a literal character rather than a wildcard. Re-ran the replacement from the original,
untouched source file and verified the fix by checking value distributions on affected numeric
columns (confirmed proper spread of 0, 1, 2, 3... instead of near-total NULLs).

**Lesson:** Wildcard characters in spreadsheet tools require literal escaping. A data cleaning
step that looks correct in a preview can still cause silent, large-scale data loss if not
verified against the original value distributions.

### Step 2: Loading into BigQuery

The cleaned CSV was loaded into Google BigQuery for all further transformation and analysis,
keeping the raw loaded table (`incident_event_log`) untouched and doing all further work on a
derived table (`incident_event_log_clean`) via `CREATE OR REPLACE TABLE ... AS SELECT`.

**Constraint encountered:** The BigQuery project is on the free tier, which does not permit DML
statements (`UPDATE`, `DELETE`) — only DDL (`CREATE TABLE AS SELECT`). All subsequent fixes were
therefore implemented as full-table rebuilds rather than in-place updates.

### Step 3: Fixing Literal "NULL" Text vs. True SQL NULL

**Issue discovered:** The Excel-based replacement in Step 1 inserted the literal text string
`"NULL"` into cells — not an actual SQL NULL value. This meant filters like
`WHERE column IS NULL` would silently return zero rows, since BigQuery saw a 4-character string,
not a true null.

**Fix:** Used `NULLIF(column, 'NULL')` across every affected string column (`caller_id`,
`opened_by`, `sys_created_by`, `location`, `category`, `subcategory`, `u_symptom`, `cmdb_ci`,
`assignment_group`, `assigned_to`, `problem_id`, `rfc`, `vendor`, `caused_by`, `closed_code`,
`resolved_by`) to convert the literal text into a genuine NULL.

**Verification:** Confirmed with `SELECT COUNT(*) WHERE column = 'NULL'` returning 0 across all
affected columns.

### Step 4: Standardizing Date/Time Columns

**Issue discovered:** BigQuery's schema auto-detect inconsistently parsed the five timestamp
columns on load — three (`opened_at`, `sys_updated_at`, `closed_at`) came in as `TIMESTAMP`,
while two (`sys_created_at`, `resolved_at`) were left as raw `STRING` in `dd-mm-yyyy HH:MM`
format.

**Fix (part 1):** Parsed the two string columns using
`PARSE_DATETIME('%d-%m-%Y %H:%M', NULLIF(column, 'NULL'))`, wrapping with `NULLIF` first since
some cells contained the literal `"NULL"` string from Step 1, which would otherwise break the
parser.

**Issue discovered (part 2):** After parsing, the two columns became `DATETIME` type while the
other three remained `TIMESTAMP` — an inconsistent mix that would block direct date arithmetic
(e.g. calculating resolution duration) between columns of different types.

**Fix (part 2):** Cast the two `DATETIME` columns to `TIMESTAMP` using `TIMESTAMP(column)`,
aligning all five date columns to the same type.

**Verification:** Queried `INFORMATION_SCHEMA.COLUMNS` to confirm all five date columns report
`data_type = TIMESTAMP`.

### Step 5: Trimming Whitespace in Text/ID Columns

**Issue discovered:** Several ID-style text columns (`opened_by`, `sys_created_by`,
`sys_updated_by`, `resolved_by`, etc.) contained inconsistent internal spacing, e.g.,
`"Opened by  8"` (double space) vs. `"Opened by 8"`, which would cause identical entities to be
treated as distinct values in grouping and joins.

**Fix:** Applied `REGEXP_REPLACE(TRIM(column), r'\s+', ' ')` across all affected text columns,
which trims leading/trailing whitespace and collapses any internal run of whitespace to a single
space.

**Verification:** Confirmed with `SELECT DISTINCT column WHERE column LIKE '%  %'` returning zero
rows across affected columns.

### Step 6: Confirming Boolean Column Types

Checked that `active`, `made_sla`, `knowledge`, and `u_priority_confirmation` — stored as
`"true"`/`"false"` text in the raw CSV — loaded correctly as native `BOOL` type in BigQuery
rather than as strings. Confirmed via `INFORMATION_SCHEMA.COLUMNS`; no casting was required.

### Step 7: Validating Categorical Columns

Spot-checked `priority`, `impact`, and `urgency` (formatted as `"N - Label"`, e.g.,
`"3 - Moderate"`) using `SELECT DISTINCT` to confirm there were no inconsistent variants, extra
whitespace, casing differences, or unexpected categories hidden across the 141,712 rows. All
values were confirmed consistent.

### Step 8: Building a Deduplicated "Latest Snapshot" View

**Issue discovered:** The cleaned table (`incident_event_log_clean`) has multiple rows per
incident, one row per state-change/update event (141,712 rows for only 24,918 unique incidents).
Using `COUNT(*)` or grouping directly on this table would overcount every incident by however
many event rows it has.

Before deduplicating, ran two validation checks to understand exactly how to collapse each
incident down to one row correctly:

**Check 1 — do descriptive columns change across an incident's lifecycle?**

```sql
SELECT number, COUNT(DISTINCT category) AS category_variants
FROM `Incident.incident_event_log_clean`
GROUP BY number
HAVING COUNT(DISTINCT category) > 1;
```

Result: A small number of incidents did have their `category` and `contact_type` reclassified
across rows, confirming that simply taking any row wouldn't be safe; the incident's *final*
value needed to be used.

**Check 2 — do the cumulative counter columns reliably increase across an incident's rows when
ordered by `sys_updated_at`?** (spot-checked on `reassignment_count`, with the same behavior
assumed for the other two counters since all three share the identical cumulative structure)

```sql
SELECT number, reassignment_count,
  LAG(reassignment_count) OVER (PARTITION BY number ORDER BY sys_updated_at) AS previous_value
FROM `Incident.incident_event_log_clean`
QUALIFY reassignment_count < previous_value;
```

Result: ~2,519 incidents (about 10%) showed the count decreasing when ordered this way, revealing
that `sys_updated_at` occasionally has duplicate or out-of-sequence timestamps within a single
incident's history, making it an unreliable sort key on its own.

**Fix:** Built the view using `sys_mod_count` (a monotonically increasing modification counter)
as the primary ordering key instead of `sys_updated_at` alone, to correctly identify each
incident's most recent state for descriptive fields. For the three cumulative counter columns
specifically (`reassignment_count`, `reopen_count`, `sys_mod_count`), used `MAX()` across each
incident's full history instead of relying on row order — since these values only ever increase,
the maximum is always the correct final total regardless of any ordering ambiguity in the source
data.

```sql
CREATE OR REPLACE VIEW `Incident.incident_latest_snapshot` AS
WITH latest AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY number ORDER BY sys_mod_count DESC, sys_updated_at DESC) AS rn
  FROM `Incident.incident_event_log_clean`
),
counters AS (
  SELECT
    number,
    MAX(reassignment_count) AS max_reassignment_count,
    MAX(reopen_count) AS max_reopen_count,
    MAX(sys_mod_count) AS max_sys_mod_count
  FROM `Incident.incident_event_log_clean`
  GROUP BY number
)
SELECT
  l.* EXCEPT(rn, reassignment_count, reopen_count, sys_mod_count),
  c.max_reassignment_count AS reassignment_count,
  c.max_reopen_count AS reopen_count,
  c.max_sys_mod_count AS sys_mod_count
FROM latest l
JOIN counters c USING (number)
WHERE l.rn = 1;
```

**Verification:** Confirmed the view returns exactly 24,918 rows (one per unique incident).
Rerunning the counter-consistency check against this corrected logic returned zero non-monotonic
rows, confirming all counter values are now reliably correct. All subsequent analysis queries
(see `SQL Queries/` and `Insights/`) run against this view.

---

## Analysis Sections

1. **Incident Volume & Trends** — incidents opened per month, top categories, contact channel mix
2. **SLA Compliance** — overall compliance rate, breach rate by priority, breach rate by team
3. **Resolution Time Analysis** — average resolution time by priority/category, outlier incidents
4. **Reassignment & Reopen Patterns** — reassignment rate, reopen rate, reopen rate by category

See the `SQL Queries/` folder for the exact query behind each question, and the `Insights/`
folder for the output table and written findings for each one.
