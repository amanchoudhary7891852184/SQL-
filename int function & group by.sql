# round truncate , mod , pwr (numeric function) 
select 10.5, round(10.5) ; 
select 10.5 , round(42.15,1) , round(46.58,-1); 

select round(45.49,-2); #0 ye value ikai dhai ki value me badlega kya 4 5 se beda hoga to 100 other wise 0
select round(76.48,-2);
# decimal ki aage value ko dekha jata hai ager decimal value ko change karni hai 
select truncate(76.35,2);
select truncate(76.35,1);
select round(76.14,1);
select mod(13,3);
select pow(2,3);
select floor(5.999) ;  # decimal hta dega 
select ceil(2.1);   # aage wali value convert kar dega 

# time functiom
select curdate() , curdate() , current_date(), now();
select now() , adddate(now() , 1);
-- adddate(col , 3 ) ;
select now() , adddate(now() ,2) , adddate(now(),interval 2 hour) ;

-- month , weak
# scaller function
select now() , date_format(now() , 'Year is %y') ; # year last 2  number 
select now() , date_format(now() , 'Year is %Y') ; # pura year 2025
select now() , date_format(now() , 'Year is %Y Month is %M') ;# month name
# aggreiagte function (multirow function ) 

use sakila; 
select count(amount) from payment where amount = 0.99 ; 

select amount, count(amount) , count(payment_id) from payment 
group by amount ; 

select customer_id , sum(amount) from payment
group by customer_id ;

select customer_id  , sum(amount) from payment
where customer_id > 3 
group by customer_id ;  

select customer_id , sum(amount) from payment  
group by customer_id 
having  sum(amount) > 100 ; 

-- get the customer id total amount spent 
select customer_id , sum(amount) from payment
WHERE EXTRACT(MONTH FROM payment_date) = 6
group by customer_id 
having sum(amount) > 50 ; 

-- multi group by 
select * from payment ;
select customer_id,amount ,extract(month from payment_date),count(amount) from payment 
group by customer_id , amount; 

-- get the average amount spent in each monnth by the staff 

SELECT 
    customer_id, 
    EXTRACT(MONTH FROM payment_date) AS month_no,
    AVG(amount) AS avg_amount
FROM payment
GROUP BY customer_id, EXTRACT(MONTH FROM payment_date);

-- diffrence between where and having clause 
-- distnict vs group by 
use sakila ;

select * from sales ; 
	-- Q.1 Average quantity  sold per product
	select product_name , avg(quantity_sold) from sales
	group by product_name ; 
    
-- Q.2 number of distinct products sold per region
select  region , count(distinct product_name) from sales
group by region ;

-- number of transactions per product  per region 
 select region ,
