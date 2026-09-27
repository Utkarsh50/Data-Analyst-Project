-- Section 6: Payments Analysis
-- Q: Find the month on month no. of orders placed using different payment types

select p.payment_type,
  EXTRACT(YEAR from o.order_purchase_timestamp) as Year,
  EXTRACT(MONTH from o.order_purchase_timestamp) as Month,
  count(o.order_id) as total_orders
from `Target.orders` o
  JOIN `Target.payments` p
  on o.order_id = p.order_id
group by payment_type, Year, Month
order by total_orders desc;
