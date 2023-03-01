select customer_id, customer_name, random() as Lucky_Rate
from customer
order by Lucky_Rate DESC
limit 5;

select 
sum(sales) as Total_revenue
from sales; --> 2297200.86

/* Question a */ --> 2291304
select 
sum(Floor(sales)) as Total_revenue
from sales;
/* Question b */ --> 2301170
select 
sum(ceil (sales)) as Total_revenue
from sales;
/* Question c */ --> 2297304
select 
sum(round(sales)) as Total_revenue
from sales;

select sum(ceil(sales)) as higher_int_sales, sum(floor(sales)) as lower_int_sales,
sum(round(sales)) as round_int_sales from sales;