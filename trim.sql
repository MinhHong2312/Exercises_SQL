select trim(leading ' ' from '   AVB  ');
select trim (trailing ' ' from '    adrow3o   ');
select trim (both 'A' from 'AaaaAaAaAAAA');
select rtrim ('AVGGG', 'G');

select customer_name, lower(rtrim(State, 'a')) as New_State from customer;

select customer_name, trim(State, 'a') from customer;

select customer_name, trim(leading 'C' from state) from customer;