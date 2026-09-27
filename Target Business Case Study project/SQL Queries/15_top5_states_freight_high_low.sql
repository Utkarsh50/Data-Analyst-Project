-- Section 5: Sales, Freight & Delivery Time
-- Q: Find out the top 5 states with the highest & lowest average freight value

WITH freight_rank as (
  select c.customer_state,
    ROUND(AVG(oi.freight_value),2) as average_freight_value_by_state
  from `Target.customers` c JOIN `Target.orders` o
    on c.customer_id = o.customer_id
    JOIN `Target.order_items` oi
    ON oi.order_id = o.order_id
  group by c.customer_state),

highest_freight as (
  select f.customer_state,
    f.average_freight_value_by_state as highest_average_freight_value,
    ROW_NUMBER() OVER (order by f.average_freight_value_by_state desc) as row_rank
  from freight_rank f
  order by highest_average_freight_value desc limit 5),

lowest_freight as(
  select f.customer_state,
    f.average_freight_value_by_state as lowest_average_freight_value,
    ROW_NUMBER() OVER (order by f.average_freight_value_by_state asc) as row_rank
  from freight_rank f
  order by lowest_average_freight_value limit 5)

select f1.customer_state as highest_state,
  f1.highest_average_freight_value,
  f2.customer_state as lowest_state,
  f2.lowest_average_freight_value
from highest_freight f1 JOIN lowest_freight f2 ON f1.row_rank = f2.row_rank;
