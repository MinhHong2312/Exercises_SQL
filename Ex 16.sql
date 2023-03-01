Select *
from customer
where customer_name~* '^a+[a-z\s]+$';

select *
from customer
where customer_name~* '^(a|b|c|d)+[a-z\s]+$';

select *
from customer
where customer_name~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

--EX 16
select * from customer
where customer_name~* '^[a-z]{5}\s(a|b|c|d)[a-z]{4}';

create table Zipcode (Pin_or_Zip_Codes varchar);
insert into Zipcode
values (234432),
(23345),
('sdfe4'),
('123&3'),
(67424),
(7895432),
(12312);

select * from Zipcode;

select * from Zipcode
where Pin_or_Zip_Codes~* '^[a-z0-9]{5,6}$';