select * from customer;
select * from sales;

select order_id, max (order_date) as Order_date_Sum, max(customer_id) as Customer_id_Sum,
	   sum(sales) as Revenue
from sales
Group by order_id
order by revenue;

select order_id, order_date, customer_id, sum (sales) as Revenue
from sales
Group by order_id, order_date, customer_id
order by revenue;

create table order_rollup as (select order_id, order_date, customer_id, sum (sales) as Revenue
from sales
Group by order_id, order_date, customer_id
order by revenue);

create table order_rollup_state as (
select a.*,
b.state
from order_rollup as a
left join customer as b
on a.customer_id = b.customer_id);

select * from order_rollup_state
order by revenue;

select a.order_id, a.order_date, a.customer_id, sum (a.sales) as Revenue,
b.state 
from sales as a
left join customer as b
on a.customer_id = b.customer_id
Group by order_id, order_date, a.customer_id, b.state
order by revenue;

select *, sum(revenue) over (
partition by state)as sum_revenue, sum (revenue) over (
partition by state order by order_date)as running_total
from order_rollup_state;

select customer_id, order_date, order_id, revenue,
lag(revenue,1) over (partition by customer_id
				   order by order_date) as Previous_Sales,
lag(order_id,1) over (partition by customer_id
				   order by order_date) as Previous_order_id
from order_rollup_state;

select customer_id, order_date, order_id, revenue,
lag(revenue,2) over (partition by customer_id
				   order by order_date) as Previous_Sales,
lag(order_id,2) over (partition by customer_id
				   order by order_date) as Previous_order_id
from order_rollup_state;

select customer_id, order_date, order_id, revenue,
lead(revenue,1) over (partition by customer_id
				   order by order_date) as Lastest_Sales,
lead(order_id,1) over (partition by customer_id
				   order by order_date) as Lastest_order_id
from order_rollup_state;