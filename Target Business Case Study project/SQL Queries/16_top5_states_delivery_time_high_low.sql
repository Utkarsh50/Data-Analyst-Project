-- Section 5: Sales, Freight & Delivery Time
-- Q: Find out the top 5 states with the highest & lowest average delivery time

WITH avg_time_deliver as
(select
  c.customer_state,
  ROUND(AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)),2) as avg_time_to_deliver
from `Target.customers` c
  JOIN `Target.orders` o
  ON c.customer_id = o.customer_id
where order_status = 'delivered' and order_delivered_customer_date is NOT NULL
group by c.customer_state
),
highest_avg_time as(
  select customer_state,
    avg_time_to_deliver,
    ROW_NUMBER() over(order by avg_time_deliver.avg_time_to_deliver desc) as high
  from avg_time_deliver
  order by avg_time_to_deliver desc limit 5
),
lowest_avg_time as(
  select customer_state,
    avg_time_to_deliver,
    ROW_NUMBER() over(order by avg_time_deliver.avg_time_to_deliver asc) as low
  from avg_time_deliver
  order by avg_time_to_deliver asc limit 5
)
select h.customer_state as highest_customer_state,
  h.avg_time_to_deliver as highest_avg_delivery_time,
  l.customer_state as lowest_customer_state,
  l.avg_time_to_deliver as lowest_avg_delivery_time
from highest_avg_time h JOIN lowest_avg_time l
  ON high = low;
