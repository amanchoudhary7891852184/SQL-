create table employee81(eid int , ename varchar(20) , managerid int);
insert into employee81 values(10,"yash",null) , (11,"aman",12),(12,"naina",10),
(13,"happy singh",11);
select * from employee81;

-- select e.eid ,e.ename , e.mangerid , mgr.ename from employee as e join manager as mgr where e.managerid = mgr.eid ; 

select e.eid ,e.ename , mgr.ename from employee81 as e join 
employee81 as mgr where e.managerid = mgr.eid ; 

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    PrerequisiteCourseID INT,
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Course(CourseID)
);

INSERT INTO Course (CourseID, CourseName, PrerequisiteCourseID)
VALUES
    (1, 'Intro to Programming', NULL),
    (2, 'Data Structures', 1),
    (3, 'Algorithms', 2),
    (4, 'Databases', 1),
    (5, 'Advanced Databases', 4),
    (6, 'Computer Networks', NULL),
    (7, 'Operating Systems', 2),
    (8, 'Computer Architecture', 1),
    (9, 'Machine Learning', 3),
    (10, 'Artificial Intelligence', 3),
    (11, 'Deep Learning', 9),
    (12, 'Compiler Design', 7),
    (13, 'Cloud Computing', 6),
    (14, 'Cybersecurity Fundamentals', 6),
    (15, 'Blockchain Technology', 14);
    
select c.CourseID , c.CourseName , c.PrerequisiteCourseID  from course as c
join course cc where  cc.PrerequisiteCourseID = c.courseid  ; 

select c.courseid, c.coursename, c.prerequisitecourseid, cr.coursename from course as c
left join course as cr on c.prerequisitecourseid = cr.courseid;

use sakila ; 
select * from  film ; 
select * from language ; 

select f.title , l.name from  film f
join language l on f.language_id = l.language_id ; 

use sakila ; 
select a.actor_id ,a.first_name from actor as a 
join film_actor  as fa  where a.actor_id  = fa.actor_id ;

-- natural join is kin of join available  which act inner join
-- dono columns ke name hone chaiye  
select a.actor_id ,a.first_name from actor as a 
natural join film_actor  as fa  ; 

select * from product ; 
select * from orders ; 

-- lect o.oid , o.location , o.
-- inner join                     -> on, where , using  where jab likhte hai jab hum inner likhte hai 
-- table join table 2 where clause 
-- table inner 
-- caryesian join m*n 10*2a

select a.actor_id ,a.first_name from actor as a 
    join film_actor  as fa  where a.actor_id  = fa.actor_id ;

select a.actor_id ,a.first_name from actor as a 
    inner join film_actor  as fa  on a.actor_id  = fa.actor_id ;
    
select a.actor_id ,a.first_name , fa.film_id from actor as a 
    inner join film_actor  as fa  using(actor_id);
    
select a.first_name,count(fa.film_id6) from actor as a 
    join film_actor  as fa  where a.actor_id  = fa.actor_id 
    group by a.first_name  ; 

-- 3 table ke sath combine 
select act.actor_id , act.first_name,fa.film_id , f.title  from actor as act
join film_actor as fa on act.actor_id = fa.actor_id 
join film as f on fa.film_id = f.film_id ; 

select act.actor_id , act.first_name,fa.film_id , film.title  from actor as act
join film_actor as fa join film
   where act.actor_id = fa.actor_id and fa.film_id  = film.film_id ; 
   
use world ; 
show tables ; 

select * from city ; 
select * from country ; 
select * from countrylanguage ; 

-- Get the city name and district where the district does not have “Noord”.
select name  as city_n , district  from city 
where district not like '%Noord%' ; 

-- Get the total number of cities in each country having city population greater than 1.5 lakh (150,000).
select co.name  , count(*)  from city c 
join  country  co on c.countrycode  = co.code
where co.Population  > 150000 
group by co.name  ; 


#select countrycode , count(name) from table where population > 150000 group by countrycode 
 
-- get the district names which have more than two cities
select countrycode , district , count(name) from city
group by countrycode , district 
having count(name) > 2  ; 

-- homework  --
-- find the city name the countrycode and the county name where country population is grater than 50000 
-- GET THE DISTRICt and the total population for each country 
-- get the total number of countryes present in each contiment having there indenpendence after 1920 
-- get the average surface area the total population average like expecttenci and the total number of contient available for each region
use world ; 
select * from city ; 
select * from country ; 
-- 1  Find the city name, the country code, and the country name where the country population is greater than 50,000.
select c.name , c.countrycode , co.name from  city c 
join country co  on c.countrycode = co.code 
where co.population > 50000 ; 

-- 2  Get the district and the total population for each country.
select c.District , co.name , sum(c.District) from city 
join country co on c. c.countrycode = co.code 
group by co.name , c.District ; 

-- 2 Get the district and the total population for each country.
select co.name , c.district , sum(c.population) from city c 
join country co on c.countrycode = co.code 
group by co.name , c.district ;

-- 3 . Get the number of countries in each continent that became independent after 1920.
select continent ,count(name) as totalcountry  from country 
where indepyear > 1920
group by  continent; 

-- For each region, get the average surface area, total population, average life expectancy, and the total number of 
-- countries.
select * from city  ; 
select * from country ; 

हर region के लिए avg surface area, total population, avg life expectancy, और countries की कुल संख्या निकालो।
select region, avg(surfacearea),sum(population) ,avg(lifeexpectancy) , count(name)  from country
group by region;


