# % of Incidents Reassigned + Average Reassignment Count

**Query:** [`../SQL Queries/11_pct_reassigned_incidents.sql`](../SQL%20Queries/11_pct_reassigned_incidents.sql)

## Output

| total_incidents | reassigned_incidents | pct_reassigned | avg_reassignment_count |
|-------------------|------------------------|------------------|---------------------------|
| 24918 | 11369 | 45.63 | 0.94 |

## Insights

Of 24,918 incidents, 11,369 (45.63%) were reassigned at least once, with an average of 0.94
reassignments per incident overall.

Nearly half of all incidents require reassignment before resolution, indicating a substantial gap
in initial ticket routing or accuracy. This suggests an opportunity to improve the assignment
process at the point of ticket creation, whether through better categorization rules, improved
training, or automated routing logic, which could reduce handling time and administrative overhead
across the organization.
