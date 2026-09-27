-- Section 4: Impact on Economy
-- Q: % increase in the cost of orders from 2017 to 2018 (Jan-Aug only)
-- Approach 1: Total percentage in 2017 vs 2018 from January to August

WITH total_payment AS (
  select EXTRACT(YEAR from o.order_purchase_timestamp) as Year,
    EXTRACT(MONTH from o.order_purchase_timestamp) as Month,
    SUM(p.payment_value) as total_monthly_payment
  from `Target.orders` o JOIN `Target.payments` p
    ON o.order_id = p.order_id
  group by Year,Month
  order by Year,Month),

yearly_monthly_total as (
  select
    ROUND(SUM(CASE When Year = 2017 then total_monthly_payment END),2) as total_2017,
    ROUND(SUM(CASE When Year = 2018 then total_monthly_payment END),2) as total_2018
  from total_payment
  where Month between 1 and 8
)

select total_2017,
  total_2018,
  Round((total_2018-total_2017)*100/Total_2017,2) as percentage_increase
from yearly_monthly_total;
