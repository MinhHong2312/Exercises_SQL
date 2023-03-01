Select max(length(product_name)) as Longest_name
from product;

Select product_name,
sub_category, category,
(product_name|| ', ' || sub_category || ', '||category)
as product_details
from product;

select
product_id,
substring (product_id for 3) as category_short,
substring (product_id from 5 for 2) as Symbol,
substring (product_id from 8) as id
from product;

select 
string_agg(product_name, ', ')
from product
where sub_category in ('Chairs', 'Tables');

select product_id, substring(product_id for 3) as category_short, substring(product_id from 
5 for 2) as sub_short , substring(product_id from 8) as id from product;
