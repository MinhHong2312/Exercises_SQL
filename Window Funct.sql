select * from customer
where customer_name~* '^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';

select * from zipcode
where pin_or_zip_codes~* '^[0-9]{5,6}$';


select 
customer_id,
customer_name,
state,
(select sum(quantity) from sales where customer.customer_id=sales.customer_id) as Num_order,
row_number () over (
partition by state
order by num_order
) as Cust_State_ranking
from customer
;

select 
a.customer_id,
a.customer_name,
a.state,
sum (b.quantity) as Num_order,
row_number () over (
partition by state
order by num_order
) as Cust_State_ranking
from customer as a
left join sales as b
on a.customer_id = b.customer_id
;

select customer_id, count (order_id) from sales
group by customer_id
order by customer_id;

select customer_id, count (distinct (order_id)) from sales
group by customer_id
order by customer_id;

select 
a.*,
count (distinct (b.order_id)) as order_num,
sum (b.sales) as sales_tot,
sum (b.quantity) as quan_tot,
sum (b.profit) as profit_tot
from customer as a
left join sales as b
on a.customer_id = b.customer_id
Group by a.customer_id
;

create table customer_order as (select 
a.*,
count (distinct (b.order_id)) as order_num,
sum (b.sales) as sales_tot,
sum (b.quantity) as quan_tot,
sum (b.profit) as profit_tot
from customer as a
left join sales as b
on a.customer_id = b.customer_id
Group by a.customer_id
);

select customer_id, customer_name, state, order_num,
row_number () over (
partition by state
order by order_num desc) as Cust_State_ranking
from customer_order;

create table Window_EX as (select customer_id, customer_name, state, order_num,
row_number () over (
partition by state
order by order_num desc) as Cust_State_ranking
from customer_order);

select * from Window_EX
where Cust_State_ranking in (1,2,3);

select * from (select customer_id, customer_name, state, order_num,
row_number () over (
partition by state
order by order_num desc) as Cust_State_ranking
from customer_order) as a
where a.Cust_State_ranking <=3;

