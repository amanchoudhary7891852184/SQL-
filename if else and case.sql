use world ;
select code, name ,
           if(name="Aruba","terror country ", if (name="Angola","Terror","tourism")),
           indepyear from country ;

 --  if else condition we can use case 
 select code ,name ,
		case 
			when name="Aruba" then "Terror country "
            when name="Angola"then "Terror"
		else "toursim"
	end  as "jkashvdi"
    from country;
-- if then name of country start with A print country with A or s country s  otherwise => country with another name 
 select code ,name ,
		case 
			when name like "A%" then "Terror country "
            when name like "s%" then "Terror"
		else "toursim"
	end  as "starting name"
    from country;
select name, indepyear ,ifnull(indepyear,0) from country ; 
select count(indepyear),count(ifnull(indepyear,0)) from country;
select * from country ;
select name, continent ,nullif(length(name),length(continent)) from country ; --  nullif  tells about two expression if the expression are equal ,else it will return first expression 
select name,population, 
case 
	when population > 20000 then "Developed country"
	when population > 10000 then "Developing country"
else "under developing"
end as  countryatatus
from country ;
-- sql 2 ,3,5 in sql zoo 
-- subquery 
-- query(subquery) or it is also konw as nested query 
use world ;
select * from city ;
select name,population from city where name="kabul";
select name ,population from city where Population>1780000;

select name ,population from city where Population > (select population from city where name="kabul");

-- now get the name of the city where the district is same as of the city name is amsterdam
select name from city where district = (select district from city where name="Amsterdam");
select * from country ;
-- get the country code and the country name where the continent matches with continent of the coutry albania 
SELECT code, name
FROM country
WHERE continent = (
    SELECT continent
    FROM country
    WHERE name = 'Albania'
);

-- get the continent the name of the country where the lifeexpanctency matches with the life excepanctency pf the counrty with cook island 
select continent,name from country where LifeExpectancy = (select LifeExpectancy from country where name='Cook Islands');
-- get the country code and the continent and gnp value for the countrys where the region do not match with the region of the country name benin 
select code ,continent,gnp from country where Region !=(select region from country where name ="Benin");
-- nested or subquery 
-- it of three types 
-- single row subquery  
-- if we found multipe rows then it is konw as multi row subquery 
select region, continent from country where Continent="Africa";
-- i need to get the country name and the population for all the country available in the continent europe
select name, population, continent from country where name_const();
select name, population, continent from country where continent ='Europe';
-- in single rowsubquery we can not use arithemitics operator 
--  multi row susquery (in where in ('america','africa'))
 select name, population, continent from country where name in (select name from country where continent='Europe');
 
 -- i need to get the country and the country code where the lifeexceptation match with the life  exceptation  of the country bahamas
 select * from country ;
 select name,code from  country  where lifeexpectancy = (select lifeexpectancy from country where name ='bahamas');
 


    