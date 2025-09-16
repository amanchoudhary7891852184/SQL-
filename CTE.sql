use sakila;
use xyz;
show tables;
select * from employees1;
-- Methor=d 1 [Correlated]
select empid , empname , salary deptid from employees as oute
where salary > (select avg(salary) from employees as inn where inn.deptid = oute.deptid);

-- method 2. CTE Comman table expression
with xyz as
(select deptid, avg(salary) as dsalary from employees group by deptid)
select e.empname,e.salary,xyz.dsalary from xyz join employees as e where e.deptid = xyz.deptid 
  and e.salary > xyz.dsalary;
  
use sakila;
select * from actor;
-- get the join the actor table and the film_actor table to find out the actor id and the first name and the movie actor has worked but par unhi actor ke liye nikalna hai jenka actor id 10 se bada ho 
with actors as 
(select actor_id , first_name from actor where actor_id > 10)
select a.actor_id,a.first_name , f.film_id from actors as a join film_actor as f on a.actor_id = f.actor_id;

with cte as
(select * from film_actor where actor_id > 10)
select a.actor_id , first_name , film_id from cte join actor as a where a.actor_id = cte.actor_id;

with actorCount as
(select actor_id , count(*) as movies from film_actor group by  actor_id)
select first_name , actorCount.actor_id, first_name ,actorCount.movies from actorCount 
join actor as a where actorCount.actor_id = a.actor_id;

-- because before the join filter the data 

 -- join kro enko cte se film_actor , actor , film
with ctee as 
(select * from film_actor)
select a.actor_id , a.first_name , f.film_id , f.title from ctee  join actor as a on a.actor_id = ctee.actor_id
join film as f on f.film_id = ctee.film_id;

use regex1 ; 
select * from employees; 
-- find the employee name who have the salary grater than the avg salary from dept 

select * from employees where deptid = 2 and salary > 60000 ;
select deptid , avg(salary) from employees 
group by deptid ; 
 
--  join the actor table and the film actor table to find out the actorid and the first name 
 -- and movie and person have worked but uni accctores ke liye jiska actor > 10 
 use sakila ; 
 select * from actor  ;
 select * from film_actor ; 
 
select a.actor_id , a.first_name ,fa.film_id as total_movie from actor a
join film_actor fa on a.actor_id = fa.actor_id 
where fa.film_id > 10 ;  
-- group by a.actor_id , a.first_name 

WITH ActorFilmCount AS (
SELECT a.actor_id, a.first_name, a.last_name, f.title AS film_title FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id)
SELECT actor_id,first_name, last_name,COUNT(film_title) AS total_movies FROM ActorFilmCount
GROUP BY actor_id, first_name, last_name
HAVING COUNT(film_title) > 10
ORDER BY total_movies DESC;

-- Step 1: CTE banate hain jisme join hoga
WITH actor_film_cte AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        f.film_id,
        f.title
    FROM actor a
    JOIN film_actor fa 
        ON a.actor_id = fa.actor_id
    JOIN film f 
        ON fa.film_id = f.film_id
)

-- Step 2: CTE ko use karke output le lo
SELECT *
FROM actor_film_cte;

--  what is normalization kyu use karte hai types sabko padkar aana hai 

