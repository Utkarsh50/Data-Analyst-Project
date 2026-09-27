# SLA Breach Rate by Priority

**Query:** [`../SQL Queries/05_sla_breach_rate_by_priority.sql`](../SQL%20Queries/05_sla_breach_rate_by_priority.sql)

## Output

| priority     | total_incidents | breached | breach_rate_pct |
|--------------|------------------|----------|-------------------|
| 2 - High     | 408   | 406  | 99.51 |
| 1 - Critical | 270   | 265  | 98.15 |
| 3 - Moderate | 23466 | 8321 | 35.46 |
| 4 - Low      | 774   | 123  | 15.89 |

## Insights

High priority incidents are late 99% of the time. Critical is late 98% of the time. Moderate is
late 35% of the time. Low is late only 16% of the time.

High priority tickets are actually getting solved faster on average than Low priority ones, but
they're still almost always late. The likely reason: High and Critical tickets probably have a
very tight deadline (a few hours), so even fast work isn't fast enough. Low priority tickets
probably get weeks to finish, so they easily make the deadline even though they take much longer
overall.
