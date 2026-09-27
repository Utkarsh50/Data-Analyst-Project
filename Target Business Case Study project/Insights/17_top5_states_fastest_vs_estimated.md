# Top 5 States — Fastest Delivery vs. Estimated Date

**Query:** [`../SQL Queries/17_top5_states_fastest_vs_estimated.sql`](../SQL%20Queries/17_top5_states_fastest_vs_estimated.sql)

## Output

| customer_state | avg_time_to_deliver | avg_diff_estimated_delivery |
|---|---|---|
| AC | 20.64 | -19.76 |
| RO | 18.91 | -19.13 |
| AP | 26.73 | -18.73 |
| AM | 25.99 | -18.61 |
| RR | 28.98 | -16.41 |

## Insights

States AC, RO, AP, AM, and RR have the fastest delivery *relative to their estimate* — orders in
these states arrive 16–20 days earlier than the estimated delivery date, even though (per the
previous query) their absolute delivery times are among the slowest. This suggests Target sets
conservative delivery estimates for these harder-to-reach regions.
