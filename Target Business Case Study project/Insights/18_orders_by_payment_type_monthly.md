# Orders by Payment Type (Month-on-Month)

**Query:** [`../SQL Queries/18_orders_by_payment_type_monthly.sql`](../SQL%20Queries/18_orders_by_payment_type_monthly.sql)

## Output (top 10)

| payment_type | Year | Month | total_orders |
|---|---|---|---|
| credit_card | 2017 | 11 | 5897 |
| credit_card | 2018 | 3  | 5691 |
| credit_card | 2018 | 1  | 5520 |
| credit_card | 2018 | 5  | 5497 |
| credit_card | 2018 | 4  | 5455 |
| credit_card | 2018 | 2  | 5253 |
| credit_card | 2018 | 8  | 4985 |
| credit_card | 2018 | 6  | 4813 |
| credit_card | 2018 | 7  | 4755 |
| credit_card | 2017 | 12 | 4377 |

## Insights

Credit card is by far the dominant payment method month over month. Other options exist (UPI,
debit cards, vouchers), but adoption is much lower. There are also some records marked
`'not_defined'` in the payments table that warrant further investigation — if these are actually
"cash on delivery" payments, that category should be added explicitly for data consistency.
