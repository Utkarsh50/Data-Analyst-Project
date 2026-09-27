-- Section 1: Exploratory Analysis
-- Q: Count the Cities & States of customers who ordered during the given period
-- Part 2: each customer city with their respective state

select
  c.customer_city,
  c.customer_state,
  count(o.order_id) as total_count
from `Target.customers` c JOIN `Target.orders` o
  ON c.customer_id = o.customer_id
group by c.customer_city, c.customer_state
order by total_count desc;
