-- Section 2: In-depth Exploration
-- Q: During what time of the day do Brazilian customers mostly place their orders?
-- Buckets: 0-6 Dawn, 7-12 Morning, 13-18 Afternoon, 19-23 Night

select case
  when EXTRACT(HOUR from order_purchase_timestamp) between 00 and 06 THEN 'Dawn'
  when EXTRACT(HOUR from order_purchase_timestamp) between 07 and 12 THEN 'Morning'
  when EXTRACT(HOUR from order_purchase_timestamp) between 13 and 18 THEN 'Afternoon'
  when EXTRACT(HOUR from order_purchase_timestamp) between 19 and 23 THEN 'Night'
END AS time_of_the_day,
count(order_id) as total_orders
from `Target.orders`
group by time_of_the_day
order by total_orders;
