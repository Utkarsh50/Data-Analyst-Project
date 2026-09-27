# Average Resolution Time by Priority

**Query:** [`../SQL Queries/08_avg_resolution_time_by_priority.sql`](../SQL%20Queries/08_avg_resolution_time_by_priority.sql)

## Output

| priority     | total_incidents | avg_resolution_hours |
|--------------|------------------|-------------------------|
| 4 - Low      | 674   | 282.82 |
| 1 - Critical | 270   | 265.62 |
| 3 - Moderate | 22010 | 173.94 |
| 2 - High     | 408   | 151.97 |

## Insights

Average resolution time varies significantly across priority levels: Low Priority (282.82 hours),
Critical (265.62 hours), Moderate (173.94 hours), and High Priority (151.97 hours), with High
Priority resolving fastest and Low Priority resolving slowest.

The data indicates an inconsistency between priority classification and actual resolution speed.
Critical incidents, expected to be resolved fastest given their urgency, are in fact resolved
slower than both Moderate and High priority incidents. This suggests either a gap in
prioritization adherence during ticket handling, or that Critical incidents are inherently more
complex to resolve despite requiring urgent attention.
