-- Section 4: Impact on Economy
-- Q: Calculate the Total & Average value of order price for each state

WITH total_payment_of_orders as (
  select o.order_id,
    o.customer_id,
    SUM(oi.price) as total_orders_price
  from `Target.orders` o JOIN `Target.order_items` oi
    ON o.order_id = oi.order_id
  group by o.order_id, o.customer_id
)

select
  c.customer_state,
  ROUND(SUM(total_orders_price),2) as total_order_prices,
  ROUND(AVG(total_orders_price),2) as average_order_prices
from `Target.customers` c JOIN total_payment_of_orders t
  ON c.customer_id = t.customer_id
group by c.customer_state
order by total_order_prices desc;
-- Also run with `order by average_order_prices desc` for the average-price view
