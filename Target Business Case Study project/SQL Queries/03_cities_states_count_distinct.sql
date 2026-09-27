-- Section 1: Exploratory Analysis
-- Q: Count the Cities & States of customers who ordered during the given period
-- Part 1: total distinct count of City and State

select
  count(distinct c.customer_state) as Total_states_count,
  count(distinct c.customer_city) as Total_cities_count
from `Target.customers` c JOIN `Target.orders` o
  ON c.customer_id = o.customer_id;
