# SLA Breach Rate by Assignment Group — Top Performers

**Query:** [`../SQL Queries/06_sla_breach_rate_by_assignment_group_top.sql`](../SQL%20Queries/06_sla_breach_rate_by_assignment_group_top.sql)

## Output (teams with >= 200 tickets)

| assignment_group | total_incidents | breached | breach_rate_pct |
|-------------------|------------------|----------|-------------------|
| Group 64 | 716  | 78   | 10.89 |
| Group 70 | 9444 | 1526 | 16.16 |
| Group 39 | 1199 | 374  | 31.19 |
| Group 24 | 1060 | 373  | 35.19 |
| Group 30 | 268  | 100  | 37.31 |
| Group 55 | 293  | 114  | 38.91 |
| Group 23 | 811  | 335  | 41.31 |
| Group 27 | 518  | 216  | 41.70 |
| Group 73 | 576  | 265  | 46.01 |
| Group 28 | 545  | 253  | 46.42 |

## Insights

Among teams with 200+ tickets, Group 64 has the lowest breach rate at 10.89%, followed by Group
70 at 16.16%. The rest of the top 10 range from 31% to 46%.

Group 64 stands out as the strongest performer by a wide margin; its breach rate is roughly a
third of the next-best team. Group 70 is also worth highlighting since it handles by far the most
tickets (9,444, nearly 40% of all incidents) while still keeping a relatively low 16% breach rate,
meaning it's not just accurate, it's also carrying most of the workload well.
