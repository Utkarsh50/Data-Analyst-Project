# % of Incidents Reopened

**Query:** [`../SQL Queries/12_pct_reopened_incidents.sql`](../SQL%20Queries/12_pct_reopened_incidents.sql)

## Output

| total_incidents | reopened_incidents | pct_reopened |
|-------------------|-----------------------|----------------|
| 24918 | 275 | 1.1 |

## Insights

Of 24,918 incidents, only 275 (1.1%) were reopened after being marked resolved.

The low reopen rate indicates that resolution quality is generally strong once an incident is
closed; it typically stays closed. This is a positive operational signal, suggesting that despite
challenges identified elsewhere (such as SLA breaches and inconsistent resolution times by
priority), the underlying fixes being applied are largely effective and durable.
