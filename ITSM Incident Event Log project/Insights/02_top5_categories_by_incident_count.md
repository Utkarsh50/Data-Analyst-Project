# Top 5 Categories by Incident Count

**Query:** [`../SQL Queries/02_top5_categories_by_incident_count.sql`](../SQL%20Queries/02_top5_categories_by_incident_count.sql)

## Output

| category    | Total_count |
|-------------|-------------|
| Category 42 | 3558 |
| Category 26 | 3338 |
| Category 53 | 2678 |
| Category 46 | 2432 |
| Category 32 | 1522 |

## Insights

Category 42 (3558), Category 26 (3338), Category 53 (2678), Category 46 (2432), and Category 32
(1522) account for the highest incident volumes, together representing roughly 55% of all 24,918
incidents.

Incident volume is concentrated rather than evenly spread; just 5 categories out of 50+ distinct
categories drive over half of all reported issues. This is useful for prioritization: process
improvements or automation efforts targeted at these top 5 categories would have outsized impact
compared to spreading effort evenly across all categories.
