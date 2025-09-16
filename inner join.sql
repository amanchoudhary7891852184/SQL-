# MONDAY  -- > TEST 

#Thuseday  --> 7-29-2025
#innerjoin  --> columns or table ke bich relation dekta hai
use sakila ;
create table tb(id int) ; 
insert into tb(id) values(1),(2),(3),(4),(5);
 create table t2(id int) ; 
insert into t2(id) values(1),(2),(1),(3),(4);

select * from tb ; 
select * from t2 ; 

--  select col1 , col2  from left table 
-- inner join right_table on lefttable.columne  = righttable.columnnane 

select * from tb 
inner join t2 on tb.id=t2.id ; 


select * from tb; 
select * from t2 ; 

-- Q.1 WHAT IS PRIMARY KEY ? 
-- Q.2 WHAT IS FORINE KEY  ? 

select * from tb a
inner join t2 b  on a.id=b.id ; 

-- you have to fillter on customer table with payment table
select * from customer  ;
select * from payment  ;


SELECT c.first_name, p.amount FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id;

select * from customer
inner join payment on customer.customer_id = payment_customer_id
inner join address on customer.address_id = address.address_id ;

SELECT c.first_name, p.amount, a.address FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
INNER JOIN address a ON c.address_id = a.address_id;

-- --- - used in sakila
-- list allfine will there language name get all staff mumber with there store name
-- display all invenrty item with the film title
-- list all address with city name 	
-- list all fill there with there actor and language 

 # 1. List all films along with their language names.
use sakila ; 
select * from film ; 
select * from language ; 

SELECT film.title, language.name
FROM film
INNER JOIN language ON film.language_id = language.language_id;

-- 2. Get all staff members along with their store names.
select * from staff ; 
select * from store ; 

select staff.first_name,staff.last_name ,store.store_id , store.address_id from staff 
inner join store on store.store_id = staff.store_id ; 

-- 3. Display all inventory items along with their film titles.
select * from inventory ; 
select * from film ; 

select inventory.inventory_id , film.title from film 
inner join inventory on inventory.film_id = film.film_id ; 

-- 4.ist all addresses along with their city names. 
select * from address ; 
select * from city ;
select address.address, city.city from address
inner join city on address.city_id = city.city_id ; 

-- 5. List all films along with their actors and language.
select * from film ; 
select * from film_actor  ; 
select * from language ;  
 select * from actor ; 
 
select film.title , actor.first_name , actor.last_name , language.name from film 
inner join film_actor on film.film_id  = film_actor.film_id
inner join actor on  actor.actor_id = film_actor.actor_id 
inner join language on language.language_id = film.language_id ; 

--  6. Display staff details along with store address, city, and country.
select * from store  ;  
select * from staff ; 
select * from address ; 
select * from city ; 
select * from country ; 

select staff.first_name , staff.last_name , store.store_id , address.address , city.city , country.country from staff
inner join store on staff.store_id = store.store_id
inner join  address on store.address_id = address.address_id
inner join  city on address.city_id = city.city_id
inner join  country on city.country_id = country.country_id;  




-- wensday  7/30/25
select * from t1 ; 
select * from tb where id is null  ;

select * from tb
left join t2 on tb.id = t2.id ; 

select * from tb
right join t2 on tb.id = t2.id ; 

select * from  customer ; 
SELECT 
    rental.rental_id,
    rental.customer_id,
    payment.amount
FROM rental
LEFT JOIN payment
ON rental.rental_id = payment.rental_id;


delete from tb where id is null ; 

SELECT c.first_name, r.rental_id, p.amount 
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN payment p ON r.rental_id = p.rental_id;

use sakila ; 
select * from courses  ; 
select * from enrollments ;

select c.course_name , max(e.grade) as maximum from courses c 
inner join enrollments e on c.course_id = e.course_id
GROUP BY c.course_name;


select * from film  ; 
select * from language ; 

# ----------> -<> ----------------------------------------------------> 30 - 7 - 2025 <--------------------------------<>----------------------------------------
-- # HOMEWORK 
# Q.1 List all customers with rental and payment details, including customers with no rentals.
# Ans.
 select  c.first_name , c.last_name , c.email , r.rental_date , p.amount , p.payment_date from customer c
left join rental r on c.customer_id = r.customer_id 
left join payment p on r.rental_id = p.rental_id ; 

-- Q.2 Find all films, then join them with inventory items and their rental details. 
-- Display films even if they have no inventory or rentals.
use sakila ;
select f.title , f.description , i.store_id ,  r.rental_date from film f 
left join inventory i on  f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id ; 


# Q.3 Display customers, their rental count, and total payment amount.
select c.first_name ,count(r.rental_id) , sum(p.amount) from customer c 
left join rental r on c.customer_id = r.customer_id 
left join payment p on  r.rental_id = p.rental_id 
group by c.customer_id ; 

# Q.4 List all staff members with their payment amounts. Display all payments even if the staff record is missing.
select * from staff  ; 
select * from payment ; 

select s.first_name , s.last_name  , sum(p.amount) from staff s
right join payment p on p.staff_id = s.staff_id
group by  s.first_name , s.last_name ; 

#------------------------------------------> 7-31-2025 <------------------------------------------------------
-- cross join
select count(*) from tb 
cross join t2 ; 

select * from actor ; 
select * from language ; 

select count(*) from actor
cross join language ; 

#display city country you have show
select distinct(city.city_id )  from city 
cross join country 
group by city.country_id ; 


select count(*) from city ; 

SELECT cu.country, ci.city
FROM country cu
CROSS JOIN city ci
GROUP BY cu.country, ci.city;

--  >>>>>>>>>>>>>>>self join --------------------
-- self join is use to combine the metching records of same table 

-- SELECT e1.employee_name, e2.employee_name AS manager
-- FROM employees e1
-- LEFT JOIN employees e2 ON e1.employee_id = e2.manager_id;

	-- "Display a list of staff members and their managers using the customer table."
    -- "Find customers who live in the same city."
    
use sakila ;
select * from staff ; 

select distinct(customer_id) from customer  ; 


select * from customer  ; 
use sakila ; 
select * from customer
where first_name like 'a%' ; 

select * from customer  ; 

select * from customer
where active = 1 ;


select sum(store_id)  from customer ; 

select name , marks , case 
when marks>=75 then 'a'
when marks >=70 then 'b'
when marks>=50 then 'c'
else 'fail'
end as result from student ;




select 
select e.first_name  , p.address_id from customer e , customer p
where a.customer_id=p.customer_id ;  

select * from customer ; 

SELECT 
  e.first_name AS Customer1,
  p.first_name AS Customer2,
  e.address_id
FROM 
  customer e
JOIN 
  customer p
ON 
  e.address_id = p.address_id
WHERE 
  e.customer_id <> p.customer_id;


select abs(-190) ; 
select ceil(12.9) ; 
select floor(12.6) ; 
select ascii('a') ; 

select distinct(active) from customer ; 
select concat(first_name,'',last_name) from customer  ; 

select right(first_name, 1) from customer  ; 

select locate('s','purus')  ; 
select substr(first_name , 1,5) from customer ; 


select trim('     bhj     ') ; 
select ltrim('  k') ; 

select reverse('purush') ; 

select *  from customer 
order  by active desc ; 

select now() ; 

select sysdate() ; 

select curdate() ; 

select year(now()) ; 

select month(now()) ; 

select extract(month from now()) ; 

select dayofyear(now()) ; 
select adddate(now() interval 2 month) ; 


select first_name, last_name from customer ;


select * from payment ;  
SELECT customer_id, count(first_name) as total_orders from  customer
group by  customer_id;




select c.customer_id , c.first_name , c.last_name , count(p.payment_id) as total_order from customer c
inner join  payment p on c.customer_id = p.customer_id 
group by c.customer_id, c.first_name, c.last_name  ; 


select * from c

