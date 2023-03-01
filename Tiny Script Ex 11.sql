select * from customer;
select * from sales;

select customer_id,
sum (sales) as Total_sales,
sum (quantity) as Total_quantity
from sales
where customer_id in (select customer_id from customer where age > 60)
group by customer_id
order by customer_id;


select * from product;

select 
a.product_id,
a.category,
a.sub_category,
a.product_name,
sum (b.sales) as Total_sales,
sum (b.quantity) as Total_quantity
from product as a
left join sales as b
on a.product_id = b.product_id
group by a.product_id,
a.category,
a.sub_category,
a.product_name
order by product_id;

select *, 
(select 
sum (sales) as Total_sales,
from sales
where sales.product_id = product.product_id
)
from product
Group by Product_id
Order by Product_id;

Select a.*,
sum (b.sales) as Total_sales,
sum (b.quantity) as Total_quantity
from product as a
left join sales as b
on a.product_id = b.product_id
group by a.product_id
order by product_id;

select a.*,
b.total_sales,
b.total_quantity
from product as a
left join (select product_id,
		  sum(sales) as total_sales,
		  sum (quantity) as total_quantity
		  from sales
		  group by Product_id) as b
on a.product_id = b.product_id
order by a.product_id;
		  
select a.*,
b.customer_name,
b.customer_age,
b.product_name,
b.category


select
a.customer_name,
a.age,
b.*
from customer as a
right join (select c.*, d.product_name, d.category from sales as c
		  left join product as d
		  on c.product_id = d.product_id) as b
on a.customer_id = b.customer_id;