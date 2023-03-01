select customer_id, customer_name, state, order_num,
rank() over (
PARTITION by STATE
order by order_num desc) as Ranking,
Dense_rank() over (
PARTITION by STATE
order by order_num desc) as Dense_Ranking,
row_number () over (
PARTITION by STATE
order by order_num desc)
from customer_order;

select customer_id, customer_name, state, order_num,
ntile (5) over (
PARTITION by STATE
order by order_num desc) as Group
from customer_order;

select * from (select customer_id, customer_name, state, order_num,
ntile (5) over (
PARTITION by STATE
order by order_num desc) as Group
from customer_order) as a
where a.Group = 1;