select * from customer_20_60;

select * from sales_2015;

select 
a.state,
sum (b.sales) as Total_Sales,
sum (b.quantity) as Total_quantity
from customer_20_60 as a
left join sales_2015 as b
on a.customer_id = b.customer_id
group by a.state
order by Total_sales desc;

SELECT
a.customer_id,
sum (a.sales) as Total_sales,
sum (a.quantity) as Total_quantity,
b.customer_name,
b.state
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
group by a.customer_id, b.customer_name, b.state
order by a.customer_id;

select 
customer_id, 
customer_name, 
state,
(select sum(sales) as total_sales from sales
where sales.customer_id=customer.customer_id
group by customer_id)
from customer
order by customer_id;

select * from sales
where customer_id in (select customer_id from customer where age <60);

select 
a.product_id,
a.category,
a.product_name,
b.Total_sales
from product as a
left join (select product_id,
		   sum (sales) as Total_sales
		  from sales
		  group by product_id) as b
on a.product_id = b.product_id;
