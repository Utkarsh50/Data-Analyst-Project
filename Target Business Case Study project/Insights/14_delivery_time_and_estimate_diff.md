# Delivery Time & Estimate Difference

**Query:** [`../SQL Queries/14_delivery_time_and_estimate_diff.sql`](../SQL%20Queries/14_delivery_time_and_estimate_diff.sql)

## Output (sample of 10 rows)

| order_id | time_to_deliver | diff_estimated_delivery |
|---|---|---|
| bfbd0f9bdef84302105ad712db... | 54 | 36  |
| 98974b076b01553d49ee64679... | 43 | 6   |
| c4b41c36dd5d89e901f6f79f25a... | 36 | -14 |
| d2292ff2201e74c5db154d1b7a... | 29 | -20 |
| 95e01270fcbac986342340010... | 30 | -19 |
| ed8fc7b1b3eb258c70ce0c7423... | 44 | -6  |
| 5cc475c7c032900848b2e742c... | 68 | 18  |
| 6b3ee7697a02619a0ace2b3f0a... | 47 | -2  |
| 3b2ca9293a7ce53fea2379d570... | 43 | -7  |
| b2f92b2f7047cd8b35580d629d... | 43 | -7  |

## Insights

A positive `diff_estimated_delivery` value indicates the order was delivered later than the
estimated delivery date, while a negative value indicates it was delivered earlier than expected.
`time_to_deliver` shows how long it takes for an order to reach the customer from the purchase
date.
