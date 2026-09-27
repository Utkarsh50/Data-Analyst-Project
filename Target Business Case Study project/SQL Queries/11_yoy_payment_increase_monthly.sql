-- Section 4: Impact on Economy
-- Q: % increase in the cost of orders from 2017 to 2018 (Jan-Aug only)
-- Approach 2: Month on Month percentage between 2017 and 2018

WITH total_payment AS (
  select EXTRACT(YEAR from o.order_purchase_timestamp) as Year,
    EXTRACT(MONTH from o.order_purchase_timestamp) as Month,
    SUM(p.payment_value) as total_monthly_payment
  from `Target.orders` o JOIN `Target.payments` p
    ON o.order_id = p.order_id
  where EXTRACT(MONTH from o.order_purchase_timestamp) between 1 and 8
    and EXTRACT(YEAR from o.order_purchase_timestamp) in (2017, 2018)
  group by Year,Month),

monthly_sum as(
  select
    Month,
    ROUND(SUM(CASE WHEN Year = 2017 then total_monthly_payment END),2) as monthly_sum_2017,
    ROUND(SUM(CASE WHEN Year = 2018 then total_monthly_payment END),2) as monthly_sum_2018
  from total_payment
  group by Month)

select Month,
  monthly_sum_2017,
  monthly_sum_2018,
  ROUND(((monthly_sum_2018-monthly_sum_2017)*100/monthly_sum_2017),2) as monthly_percentage
from monthly_sum
order by Month;
