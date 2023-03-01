SELECT
order_line,
sales,
ceil(sales),
floor (sales)
from sales
where discount > 0;

select random(), random()*40 + 10,
floor (random() * 40) + 10
;

select setseed (0.5);
select random();-->0.2499
select random ();--> 0.5200
select random ();--> 0.4611
select random (); --> 0.2277

select setseed (0.5);
select random();-->0.2499
select random ();--> 0.5200
select random ();--> 0.4611
select random ();--> 0.2277
select random (); --> 0.1848

select setseed (0.75);
select random (); --> 0.874

select setseed (0.75);
select random ();--> 0.874 (được save ở trên)
select random (); --> 0.6450 (k lưu lại giá trị nữa mà sẽ random số khác)