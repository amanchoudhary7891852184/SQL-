show databases;
use sakila;
select * from actor;
SELECT  actor_id, last_name FROM actor;
select actor_id,actor_id*10,last_name from actor;
seleCT * from actor where first_name ='ED' ;
seleCT * from actor where first_name ='ED' and actor_id>100  ;
seleCT * from actor where first_name ='ED' or actor_id>100;
select * from actor where actor_id>10 and actor_id<25;
select * from actor where actor_id  between 10 and 25;


--- like % [zero or more character ] __[only 1 character ]
select * from actor where first_name like "nick";
select * from actor where first_name like "s%";
select * from actor where first_name like "%s";
------ functions 
show databases ;
use sakila ;
select * from actor;
select  actor_id,last_name,first_name from actor ;
select actor_id*10, last_name from actor ;
-- comment  between operator  between lower and higher 
select * from actor where actor_id between 11 and 24;
----- aggregate functions :for calculation 
-- max ,min ,sum ,count
select * from payment;
select count(amount) from payment ;
select sum(amount),count(amount) from payment ;
select sum(amount),count(amount),avg(amount) from payment where customer_id=1 ;
select sum(amount) as totalTransction,
count(amount),avg(amount) as avgamount
from payment where customer_id=1 ;
 ---- groupby --> collection of similar values 
select customer_id from payment group by customer_id; 
select customer_id ,count(amount) from payment group by customer_id; 
# round Truncate ,mod , pwr (numeric function )
select 5.1 , round(5.1),round(10.34,1);
select round(46.2 ,-2);
---- truncate 
select truncate(76.32,1);
--- string functions, number functions 
select  curtime() ,  curdate(),now();
select now();
SELECT NOW(), ADDDATE(NOW(), 20), ADDDATE(NOW(), INTERVAL 2 HOUR);
--  adddate ,year , now(),month(),extract,date_format,dataed 
-- ---- functions 
use sakila;
select * from payment ;
select count(*) from payment where amount=2.99;
select * from payment group by amount ;
select amount from payment group by amount ;
select  amount , count(amount) from payment group by amount ;
select amount , count(amount), count(payment_id) from payment group by amount;








