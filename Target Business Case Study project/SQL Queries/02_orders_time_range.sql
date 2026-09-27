-- Section 1: Exploratory Analysis
-- Q: Get the time range between which the orders were placed

select
  min(order_purchase_timestamp) as first_order_placed,
  max(order_purchase_timestamp) as last_order_placed,
  DATE_DIFF(max(order_purchase_timestamp), min(order_purchase_timestamp), day) as total_days_range
from `Target.orders`;
