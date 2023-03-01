select sales, 'Total sales is' || to_char (sales, '9999.99') as Message
from sales;

select sales, 'Total sales is ' || to_char (sales, 'L9999.99') as Message
from sales;

select sales, 'Total sales is ' || to_char (sales, '$9999.99') as Message
from sales; --> same result as 'L'

select order_date, to_char(order_date, 'DD/MM/YYYY')
from sales;

select order_date, to_char(order_date, 'DD, Month, YYYY')
from sales;

select order_date, to_char(order_date, 'Day, Month, YYYY')
from sales;

select to_date ('2019/01/15', 'YYYY/MM/DD');

select to_number ('12.12', '99.99');
select to_number ('$1266.12', 'L9999.99'); --> remove currency