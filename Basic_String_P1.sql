select customer_name, length (customer_name) as Characters
from customer
where age > 30;

select distinct state, length (state) as Number
from customer;

select customer_name, country, replace (country, 'United State','US') as Country_New
from customer;

select * from customer;

select customer_name, city, replace (lower(city), 'akron', 'A') as New_City
from customer
order by city;

select customer_name, upper (customer_name) as Upper from customer;

select upper('Meo') as Test;