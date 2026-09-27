-- Section 7: Actionable Insights & Recommendations
-- Q: Highest average delivery time and total customers, by state

WITH avg_time_deliver as
(select
  c.customer_state,
  ROUND(AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)),2) as avg_time_to_deliver,
  count(c.customer_id) as total_customer
from `Target.customers` c
  JOIN `Target.orders` o
  ON c.customer_id = o.customer_id
where order_status = 'delivered' and order_delivered_customer_date is NOT NULL
group by c.customer_state
)
select customer_state,
  avg_time_to_deliver,
  total_customer
from avg_time_deliver
order by avg_time_to_deliver desc;
