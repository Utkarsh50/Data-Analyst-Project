# Reopen Rate by Category

**Query:** [`../SQL Queries/13_reopen_rate_by_category.sql`](../SQL%20Queries/13_reopen_rate_by_category.sql)

## Output (categories with >= 30 incidents)

| category    | total_incidents | reopened_incidents | reopen_rate_pct |
|-------------|------------------|-----------------------|--------------------|
| Category 22 | 52   | 2  | 3.85 |
| Category 7  | 31   | 1  | 3.23 |
| Category 61 | 810  | 19 | 2.35 |
| Category 57 | 971  | 17 | 1.75 |
| Category 9  | 1155 | 17 | 1.47 |
| Category 53 | 2678 | 38 | 1.42 |
| Category 40 | 436  | 6  | 1.38 |
| Category 43 | 153  | 2  | 1.31 |
| Category 17 | 79   | 1  | 1.27 |
| Category 32 | 1522 | 19 | 1.25 |
| Category 26 | 3338 | 39 | 1.17 |
| Category 20 | 1047 | 12 | 1.15 |
| Category 23 | 1063 | 12 | 1.13 |

## Insights

Category 22 has the highest reopen rate at 3.85%, followed by Category 7 (3.23%) and Category 61
(2.35%). These figures remain low in absolute terms, and notably, none of the categories
previously identified as slow-resolving (Category 34, 45, 55, 46) appear among the highest
reopen-rate categories.

Reopen rate and resolution speed appear to be independent issues rather than symptoms of the same
root cause. Categories with the longest resolution times are not the same categories experiencing
repeated reopens, indicating two distinct areas for operational attention: categories requiring
faster resolution (Category 34, 45) and a separate, smaller set of categories requiring improved
fix quality on first attempt (Category 22, 7, 61).
