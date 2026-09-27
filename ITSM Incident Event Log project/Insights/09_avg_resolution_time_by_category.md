# Average Resolution Time by Category

**Query:** [`../SQL Queries/09_avg_resolution_time_by_category.sql`](../SQL%20Queries/09_avg_resolution_time_by_category.sql)

## Output (top 10)

| category    | total_incidents | avg_resolution_hours |
|-------------|------------------|-------------------------|
| Category 34 | 499 | 1325.84 |
| Category 33 | 16  | 1106.94 |
| Category 55 | 106 | 673.54  |
| Category 56 | 40  | 596.85  |
| Category 22 | 50  | 502.32  |
| Category 45 | 589 | 481.30  |
| null        | 7   | 467.00  |
| Category 62 | 4   | 324.00  |
| Category 46 | 2356| 315.56  |
| Category 47 | 6   | 295.67  |

## Insights

Category 34 exhibits the longest average resolution time at 1,325.84 hours (approximately 55
days), nearly double that of the next-highest category, Category 33 (1,106.94 hours). The
majority of remaining categories average well below 700 hours.

Category 34 represents a significant outlier in resolution performance, and given its notable
incident volume (499 incidents), it warrants dedicated investigation. The scale of delay observed
is disproportionate to other categories and may indicate a structural bottleneck such as
dependency on external vendors, hardware procurement, or cross-team coordination rather than a
routine handling delay.
