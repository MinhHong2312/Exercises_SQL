
--> way 1, done by Tiny
SELECT
extract (month from b.order_date) as Month,
sum (b.sales) as Monthly_Sales_Chairs
from product as a
left join sales as b
on a.product_id = b.product_id
where sub_category = 'Chairs'
Group by Month
order by Month;

--> the answer of the excercise
select extract(month from order_date) as month_n, sum(sales) as total_sales from sales
where product_id in (select product_id from product where sub_category = 'Chairs')
group by month_n
order by month_n ;
