-- Section 7: Actionable Insights & Recommendations
-- Q: For delivered status, delivery_date and approved date is missing

select
  order_id,
  customer_id,
  order_purchase_timestamp,
  order_approved_at,
  order_delivered_customer_date
from `Target.orders`
where order_status = 'delivered' and (order_approved_at is NULL or
  order_delivered_customer_date is NULL);
