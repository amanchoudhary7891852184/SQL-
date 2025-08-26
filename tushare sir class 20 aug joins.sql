use sakila ;
select * from actor ;
select * from film_actor ;
select a.actor_id ,a.first_name from actor as a 
join film_actor as fa where a.acotr_id=fa.actor_id;
--  natrual join is kind of join we do not use in sql because if in table  the comman column it act as a ----  
-- cross join is also called creation join   
select a.actor_id ,a.first_name,film_id from actor as a 
join film_actor as fa where a.acotr_id=fa.actor_id;
select a.actor_id ,a.first_name ,fa.film_id from actor as a inner join  flim_actor as fa on a.actor_id = fa.actor_id;
select  * from film_actor;
select a.first_name, count(fa.film_id) from actor as a join film_actor as fa where a.actor_id=fa.actor_id group by a.film_name ;
select * from film;
select act.actor_id , act.first_name,factor.film_id ,film.title from actor as act 
join film_actor as facotr join film 
where act.actor_id=factor.actor_id and factor.film_id =film.film_id; 
use world ;
select * from city ;
select * from country ;
select name,district from city where district not like "noord"
select co.name  , count(*)  from city c 
join  country  co on c.countrycode  = co.code
where co.Population  > 150000 
group by co.name  ;
select * from city ;

select c.name , c.countrycode , co.name from city as c join country as co on c.countrycode = co.code where co.population > 50000;
SELECT co.Name AS Country,SUM(ci.Population) AS Total_Population
FROM City ci
JOIN Country co ON ci.CountryCode = co.Code GROUP BY co.Name ORDER BY Total_Population DESC;

use world;
select c.name as city_name,c.countrycode , co.name as country_name from city c join country co on c.countrycode=co.code  where c.population > 50000;
 
select co.name as country_name , c.district , sum(c.population) as total_population from city c join country co on c.countrycode =co.code group by co.name ,c.district;