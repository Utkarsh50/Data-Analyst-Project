# Outlier Incidents (Longest Resolution Times)

**Query:** [`../SQL Queries/10_outlier_incidents_longest_resolution.sql`](../SQL%20Queries/10_outlier_incidents_longest_resolution.sql)

## Output (top 12 of 20)

| number     | category    | priority     | assignment_group | reassignment_count | opened_at            | resolved_at           | resolution_hours |
|------------|-------------|--------------|-------------------|----------------------|------------------------|-------------------------|--------------------|
| INC0001839 | Category 45 | 3 - Moderate | Group 31 | 0 | 2016-03-03 11:23:00 UTC | 2017-02-02 17:33:00 UTC | 8070 |
| INC0001349 | Category 45 | 4 - Low      | Group 67 | 2 | 2016-03-02 14:13:00 UTC | 2017-01-30 18:29:00 UTC | 8020 |
| INC0007343 | Category 46 | 3 - Moderate | Group 31 | 1 | 2016-03-15 14:23:00 UTC | 2017-02-03 18:04:00 UTC | 7803 |
| INC0001881 | Category 55 | 4 - Low      | Group 35 | 1 | 2016-03-03 12:10:00 UTC | 2017-01-02 08:37:00 UTC | 7316 |
| INC0001978 | Category 55 | 4 - Low      | Group 35 | 1 | 2016-03-03 14:42:00 UTC | 2017-01-02 08:38:00 UTC | 7313 |
| INC0001984 | Category 55 | 4 - Low      | Group 35 | 1 | 2016-03-03 14:47:00 UTC | 2017-01-02 08:39:00 UTC | 7313 |
| INC0019986 | Category 42 | 3 - Moderate | Group 3  | 0 | 2016-04-15 17:43:00 UTC | 2017-02-10 14:18:00 UTC | 7220 |
| INC0000343 | Category 45 | 4 - Low      | Group 31 | 0 | 2016-02-29 15:14:00 UTC | 2016-12-22 09:31:00 UTC | 7122 |
| INC0000307 | Category 45 | 4 - Low      | Group 66 | 0 | 2016-02-29 14:30:00 UTC | 2016-12-19 14:55:00 UTC | 7056 |
| INC0003982 | Category 37 | 3 - Moderate | Group 47 | 4 | 2016-03-08 08:54:00 UTC | 2016-12-13 17:54:00 UTC | 6729 |
| INC0005897 | Category 57 | 3 - Moderate | Group 34 | 0 | 2016-03-11 10:52:00 UTC | 2016-12-09 16:50:00 UTC | 6557 |
| INC0000298 | Category 53 | 4 - Low      | Group 66 | 0 | 2016-02-29 14:16:00 UTC | 2016-11-25 08:07:00 UTC | 6473 |

## Insights

The twenty longest-resolving incidents ranged from approximately 6,200 to over 8,000 hours (9
months to over a year). These incidents predominantly belong to Category 45, Category 55, and
Category 46, with the majority classified as Low or Moderate priority; very few are Critical.

The concentration of extreme delays within a small set of categories and lower-priority
classifications indicates these incidents may have been deprioritized rather than genuinely
difficult to resolve. This finding directly explains the elevated average resolution time for
identified Low Priority incidents, suggesting the overall average is skewed by a limited number
of severely delayed cases rather than reflecting the typical handling time for that priority tier.
