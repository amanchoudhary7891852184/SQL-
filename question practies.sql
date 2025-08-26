use sakila ;
select * from payment ;
SELECT payment_id, customer_id, amount
FROM payment
WHERE amount = ANY (
    SELECT amount
    FROM payment
    WHERE payment_id IN (2, 3, 5)
);
SELECT payment_id, customer_id, amount
FROM payment
WHERE amount > ANY (
    SELECT amount
    FROM payment
    WHERE payment_id IN (2, 3, 5)
);
-- get the name of the country whose population is grater than the  all the population amoung the continent name is north america 
 SELECT name, population FROM country WHERE population > ALL (SELECT population FROM country WHERE continent = 'North America');

use world ;
select * from country; 
-- select name, population from country where > All (select population from country where continent ='north america');
-- get the country code the name of the country whoes life expentancy is same as for the countries from europe
SELECT code, name, lifeexpectancy
FROM country
WHERE lifeexpectancy IN (
    SELECT lifeexpectancy
    FROM country
    WHERE continent = 'Europe'
      AND lifeexpectancy IS NOT NULL
);

-- get the name and the continent for the country who have got their independence near by the independence year of the country asia 
select name, continent ,indepyear from country where IndepYear in(select IndepYear from country where Continent ='asia' and IndepYear is not null);
select continent , count(*) from counrty where indepyear > any(select indepyear from country where Continent="asia") and group by continent ;
select * from country ;
select * from country order by name ;
select * from country order by  region,SurfaceArea;


 
