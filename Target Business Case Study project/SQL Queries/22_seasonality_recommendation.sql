-- Section 7: Actionable Insights & Recommendations
-- Q: Seasonality — which months see the highest order volume

select
  EXTRACT(YEAR from o.order_purchase_timestamp) as Year,
  EXTRACT(MONTH from o.order_purchase_timestamp) as Month,
  count(o.order_id) as total_orders
from `Target.orders` o
group by Year, Month
order by total_orders desc limit 3;
