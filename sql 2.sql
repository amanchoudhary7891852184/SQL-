 --  order by , alias ,multi-row functions -- 
 use sakila ;
 show tables ;
 select * from actor order by first_name;
 select * from actor order by first_name , actor_id desc;
 select actor_id ,actor_id+10 from actor ;
 select  actor_id from actor  ;
 select actor_id from actor order by actor_id asc;
 select distinct(customer_id) from payment ; -- distinct is used to remove duplicate value 
 select count(customer_id) from payment ;
 select count(customer_id) , count(distinct(customer_id)) ,count(customer_id)-count(distinct(customer_id)) as       repetativecustomer from payment ;
 select count(amount),sum(amount),avg(amount),max(amount),min(amount) from payment ; -- aggregate function are the function which are used to perfrom calculation over seartine values and return single value 
 -- we do not select any column with aggraget function 
 select sum(amount) from payment ;
 -- group by 
-- similar value ka group 
select sum(amount) from payment where customer_id=1;
use sakila ;
select * from payment; 
select customer_id,count(amount),sum(amount) from payment group by customer_id;
select amount,count(amount) from payment group by amount;
select amount from payment group by amount;
-- find out the total payment rented the sum of amount and maximum  


