-- Section 3: Evolution of E-commerce Orders in Brazil
-- Q: Get the month on month no. of orders placed in each state

select c.customer_state,
  EXTRACT(YEAR from o.order_purchase_timestamp) as Year,
  EXTRACT(MONTH from o.order_purchase_timestamp) as Month,
  count(o.order_id) as total_orders
from `Target.customers` c JOIN `Target.orders` o
  ON c.customer_id = o.customer_id
group by c.customer_state, Year, Month
order by total_orders desc;
