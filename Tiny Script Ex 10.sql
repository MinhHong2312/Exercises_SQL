select customer_id from sales_2015
intersect 
select customer_id from customer_20_60;

select customer_id from sales_2015
except 
select customer_id from customer_20_60
order by customer_id;

select customer_id from sales_2015
Union
select customer_id from customer_20_60;
/* excercise*/

select * from sales_2015;

select * from customer_20_60;

Select customer_id, sum (sales) as Total_sales from sales
group by customer_id
order by Total_sales;

SELECT
b.state,
sum (sales) as Total_sales
from sales_2015 as a
full join customer_20_60 as b
on a.customer_id=b.customer_id
Group by b.state
order by total_sales desc;

select * from sales;
select * from product;
/* sales, quantity, product_id in sales table
categogy, product name from product table */

select a.product_id,
a.product_name,
a.category,
b.sales,
b.quantity
from product as a
left join sales as b
on a.product_id = b.product_id;


select 
a.category,
sum (sales) as Total_sales,
sum (quantity) as Total_unit_sold
from product as a
Left join sales as b
on a.product_id = b.product_id
group by category
order by total_sales;
