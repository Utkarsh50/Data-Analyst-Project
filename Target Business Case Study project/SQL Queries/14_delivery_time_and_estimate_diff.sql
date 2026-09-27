-- Section 5: Sales, Freight & Delivery Time
-- Q: Find the no. of days taken to deliver each order (time_to_deliver) and the
--    difference between estimated & actual delivery date (diff_estimated_delivery)

select
  order_id,
  order_status,
  order_purchase_timestamp,
  order_delivered_customer_date,
  order_estimated_delivery_date,
  DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY) as time_to_deliver,
  DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) as diff_estimated_delivery
from `Target.orders`
where order_status = 'delivered' and order_delivered_customer_date is NOT NULL;
