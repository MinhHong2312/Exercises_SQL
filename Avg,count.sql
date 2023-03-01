select * from customer_order;

select customer_id, customer_name, state, sales_tot as Revenue,
avg (sales_tot) over (
PARTITION by state) as Avg_Revenue
from customer_order;

select * from (select customer_id, customer_name, state, sales_tot as Revenue,
avg (sales_tot) over (
PARTITION by state) as Avg_Revenue
from customer_order) as a
where a.Revenue < a.Avg_Revenue;

select customer_id, customer_name, state,
count (customer_id) over (PARTITION by state) "Number of customer per State"
from customer_order;
