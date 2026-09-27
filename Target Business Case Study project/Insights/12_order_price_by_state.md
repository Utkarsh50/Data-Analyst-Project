# Order Price by State

**Query:** [`../SQL Queries/12_order_price_by_state.sql`](../SQL%20Queries/12_order_price_by_state.sql)

## Output — by total order price (top 10)

| customer_state | total_order_prices | average_order_prices |
|---|---|---|
| SP | 5,202,955.05 | 125.75 |
| RJ | 1,824,092.67 | 142.93 |
| MG | 1,585,308.03 | 137.33 |
| RS | 750,304.02   | 138.13 |
| PR | 683,083.76   | 136.67 |
| SC | 520,553.34   | 144.12 |
| BA | 511,349.99   | 152.28 |
| DF | 302,603.94   | 142.4  |
| GO | 294,591.95   | 146.78 |
| ES | 275,037.31   | 135.82 |

## Output — by average order price (top 10)

| customer_state | total_order_prices | average_order_prices |
|---|---|---|
| PB | 115,268.08 | 216.67 |
| AP | 13,474.3   | 198.15 |
| AC | 15,982.95  | 197.32 |
| AL | 80,314.81  | 195.41 |
| RO | 46,140.64  | 186.8  |
| PA | 178,947.81 | 184.48 |
| TO | 49,621.74  | 177.86 |
| PI | 86,914.08  | 176.3  |
| MT | 156,453.53 | 173.26 |
| RN | 83,034.98  | 172.27 |

## Insights

Most of the total payment came from SP, RJ, and MG, since these states have the largest customer
base. However, the highest *average* order value comes from PB, AP, and AC — indicating that
customers in these states spend more per order on average, even though their overall volume is
lower.
