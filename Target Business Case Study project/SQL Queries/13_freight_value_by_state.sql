-- Section 4: Impact on Economy
-- Q: Calculate the Total & Average value of order freight for each state

select
  c.customer_state,
  ROUND(SUM(oi.freight_value),2) as total_freight_value,
  ROUND(AVG(oi.freight_value),2) as average_freight_value
from `Target.customers` c JOIN `Target.orders` o
  ON c.customer_id = o.customer_id
  JOIN `Target.order_items` oi
  ON oi.order_id = o.order_id
group by c.customer_state
order by average_freight_value desc;
