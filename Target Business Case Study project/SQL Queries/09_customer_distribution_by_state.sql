-- Section 3: Evolution of E-commerce Orders in Brazil
-- Q: How are the customers distributed across all the states?

select
  c.customer_state,
  count(distinct c.customer_unique_id) as total_unique_customer,
  ROUND(count(distinct c.customer_unique_id) * 100/
    SUM(count(distinct c.customer_unique_id)) over(
      order by c.customer_state
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ),2) as total_customer_percentage
from `Target.customers` c
group by c.customer_state
order by total_customer_percentage desc;
