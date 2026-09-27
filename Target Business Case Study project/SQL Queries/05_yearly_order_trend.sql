-- Section 2: In-depth Exploration
-- Q: Is there a growing trend in the no. of orders placed over the past years?

select
  EXTRACT(YEAR from order_purchase_timestamp) as order_year,
  count(order_id) as Total_orders
from `Target.orders`
group by order_year
order by order_year;
