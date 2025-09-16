-- IN → जब हमें values की list से match करना है।

--  → जब बस यह check करना है कि कोई record exist करता है या नहीं।
-- 1. IN Statement

-- Definition: IN एक subquery से values की list लेकर outer query में compare करता है।-- 
-- 2. EXISTS Statement
		
-- Definition: EXISTS सिर्फ यह check करता है कि subquery से result आया या नहीं (True/False)।

-- in-->   
-- view is a virtual table that represents data coming from one or more real tables , and it does not store 
-- data, but rather a saved SQL query. The view displays data as rows and columns, just like a real table. 
-- This helps to simplify complex queries, limit access to data (for security), and shorten code (as a shortcut).


use sakila ; 
select first_name , count(*) from actor where actor_id > 10 
group by first_name order by count(*) desc ; 

 -- views is virtual table  that store query , does not store data 
 
 create view ve as (select first_name , count(*) from actor where actor_id > 10 
group by first_name order by count(*) desc ) ; 

select * from ve ; 
create view temp as (
select first_name , last_name  from actor ) ; 

select * from temp ; 
( select actor_id , first_name , last_name  from actor where actor_id < 7 ) ; 

select * from factors ; 


-- ctas 
create table factors as 
(select actor_id , first_name );


SELECT actor_id, first_name, last_name 
FROM actor 
WHERE actor_id < 7;

SELECT * FROM factor;
CREATE VIEW factor_view AS
SELECT actor_id, first_name, last_name 
FROM actor;
SELECT * FROM factor_view;
INSERT INTO factor_view (actor_id, first_name, last_name)
VALUES (101, 'Guddu', 'Sharma');
UPDATE factor_view
SET first_name = 'Sandeep'
WHERE actor_id = 101;
-- Original table dekhne ke liye
SELECT * FROM factor;

-- View dekhne ke liye
SELECT * FROM factor_view;
-- ------------------------------------------
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE actor_id < 7;
SELECT * FROM factor;

CREATE VIEW factor_view AS
SELECT actor_id, first_name, last_name 
FROM factor;

SELECT * FROM factor_view;

INSERT INTO factor_view (actor_id, first_name, last_name)
VALUES (101, 'Guddu', 'Sharma');

UPDATE factor_view
SET first_name = 'Sandeep'
WHERE actor_id = 101;

-- Original table dekhne ke liye
SELECT * FROM factor;

-- View dekhne ke liye
SELECT * FROM factor_view;

-- normal view dml operation hota hai  uptable 
create temporary table xyz as (
select actor_id , first_name , last_name from actor where actor_id < 7 ) ; 

with cte as 
(select actor_id , first_name , last_name from actor where actor_id < 7 ) 
select * from cte  ; 

use sakila ; 
select * from film  ; 

with cts as(
select title , description , release_year , rental_duration  from film 
where release_year >= 2006 )

select * from cts  ; 

select * from Departments ;

-- Q1. Top 5 Highest Paid Actors
-- Table: actor, film_actor, film
-- 👉 Find top 5 actors jinhone sabse jyada movies me kaam kiya hai.
-- Hint: film_actor me actor aur film ke relation hai.

select * from film_actor ; 

select * from actor ; 

with cte as (
select a.first_name , count(fc.film_id) as total_movies from actor a
join film_actor fc on  a.actor_id  = fc.actor_id 
join film f on fc.film_id = f.film_id 
group by a.first_name )

select * from cte ; 


WITH ActorMovies AS (
    SELECT a.actor_id, a.first_name, a.last_name, COUNT(fc.film_id) AS total_movies
    FROM actor a
    JOIN film_actor fc ON a.actor_id = fc.actor_id
    JOIN film f ON fc.film_id = f.film_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT first_name, last_name, total_movies
FROM ActorMovies ; 

select * from film ; 
create view views as 
select title , description ,language_id from ;

use sakila ; 
create table  sort as 
select title , release_year  from film 
where rental_duration > 2 ; 


select * from sort ; 

drop table sort ; 


select title from sort 
where title like '%R' ; 


alter table sort 
add year int  ; 

create temporary table temp_order (
order_id  int, 
amount decimal(10,2));

select * from temp_order ; 

insert into temp_order values (1,1.1),(2,1.2); 

