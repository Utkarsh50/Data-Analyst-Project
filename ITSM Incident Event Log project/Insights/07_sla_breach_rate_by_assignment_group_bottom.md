# SLA Breach Rate by Assignment Group — Bottom Performers

**Query:** [`../SQL Queries/07_sla_breach_rate_by_assignment_group_bottom.sql`](../SQL%20Queries/07_sla_breach_rate_by_assignment_group_bottom.sql)

## Output (teams with >= 200 tickets)

| assignment_group | total_incidents | breached | breach_rate_pct |
|-------------------|------------------|----------|-------------------|
| Group 10 | 343  | 257 | 74.93 |
| Group 66 | 376  | 262 | 69.68 |
| Group 31 | 205  | 140 | 68.29 |
| Group 57 | 313  | 213 | 68.05 |
| Group 72 | 367  | 232 | 63.22 |
| Group 29 | 257  | 160 | 62.26 |
| Group 33 | 201  | 123 | 61.19 |
| Group 20 | 394  | 230 | 58.38 |
| Group 25 | 1243 | 711 | 57.20 |
| Group 65 | 336  | 190 | 56.55 |

## Insights

Among teams with 200+ tickets, Group 10 has the worst breach rate at 74.93%, followed by Group 66
(69.68%), Group 31 (68.29%), Group 57 (68.05%), and Group 72 (63.22%).

These five teams miss their deadline on roughly 2 out of every 3 tickets, far worse than the 63%
overall average and dramatically worse than the best team, Group 64, at just 10.89%. That's a huge
gap between the best and worst teams doing similar work, which points to a team-specific problem
(maybe staffing, workload, or process) rather than something affecting the whole company equally.
