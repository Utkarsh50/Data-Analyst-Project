-- Section 6: Payments Analysis
-- Q: Find the no. of orders placed on the basis of the payment installments that have been paid

select p.payment_installments,
  count(o.order_id) as total_orders
from `Target.payments` p JOIN `Target.orders` o
  ON o.order_id=p.order_id
group by payment_installments
order by p.payment_installments;
