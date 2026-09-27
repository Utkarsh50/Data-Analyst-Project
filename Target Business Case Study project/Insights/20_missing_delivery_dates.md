# Data Quality: Missing Delivery/Approval Dates

**Query:** [`../SQL Queries/20_missing_delivery_dates.sql`](../SQL%20Queries/20_missing_delivery_dates.sql)

## Output (sample)

| order_id | order_approved_at | order_delivered_customer_date |
|---|---|---|
| 88083e8f64d95b93216418748... | null | 2017-03-02 12:06:06 UTC |
| d77031d6a3c8a52f019764e68f... | null | 2017-03-02 16:15:23 UTC |
| 3c0b8706b065f9919d0505d3b... | null | 2017-03-03 11:47:47 UTC |
| 2d858f451373b04fb5c984a1cc... | 2017-05-25 23:22:43 UTC | null |
| ab7c89dc1bf4a1ead9d6ec1ec8... | 2018-06-08 12:09:39 UTC | null |

## Insights

There are orders marked as `'delivered'` where `order_approved_at` and/or
`order_delivered_customer_date` are NULL. This creates inconsistencies and inaccurate results when
analyzing "completed" orders.

**Recommendation:** Investigate whether there's a communication/logging failure during the payment
approval step. The system should not allow an order's status to be set to "delivered" until the
delivery timestamp is actually recorded — enforcing this would preserve data integrity for future
analysis.
