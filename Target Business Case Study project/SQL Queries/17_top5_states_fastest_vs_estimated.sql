-- Section 5: Sales, Freight & Delivery Time
-- Q: Find out the top 5 states where order delivery is really fast vs. estimated delivery date

select
  c.customer_state,
  ROUND(AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)),2) as avg_time_to_deliver,
  ROUND(AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY)),2) as avg_diff_estimated_delivery
from `Target.orders` o JOIN `Target.customers` c ON c.customer_id = o.customer_id
where o.order_status = 'delivered' and o.order_delivered_customer_date is NOT NULL
group by c.customer_state
order by avg_diff_estimated_delivery asc limit 5;
