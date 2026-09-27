-- Section 2: In-depth Exploration
-- Q: Can we see some kind of monthly seasonality in terms of the no. of orders being placed?

select
  EXTRACT(YEAR from order_purchase_timestamp) as Year,
  EXTRACT(MONTH from order_purchase_timestamp) as Month,
  count(order_id) as Total_orders_count
from `Target.orders`
group by Year, Month
order by Total_orders_count desc;
