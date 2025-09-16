 -- tcl 
 -- transcation control language 
 -- transaction : set of logical statement consistent(insert kiya data sab ko dekhe )
-- manage kia jaye 

-- transaction (start / stop  - end)
-- transaction(commit) -- permanent save
select @@autocommit;
use regex1;
select * from courses; 
insert into courses values (778 , "abc","science0") ; 

select * from courses ; 

select @@autocommit ; 
set @@autocommit = 0 ; 

insert into courses values (779 , "rohit" , "bio") ; 
select * from courses ; 

-- transaction start :
-- start transcation 
-- or 
-- autocommit is disable  

-- dml operation  (this operation will temproary when transaction pending )

-- transaction stop  :
-- commit , rollback 
-- ddl statment 

select @@autocommit; 
insert into courses values(900 , "kamal" , "kamal khan") ; 
update courses set coursename = "regex" ; 
select * from courses ; 
rollback ;  # save nhi hoga record discard hojayega 

select * from courses ; 

/* 
Autocommit ON → INSERT → record turant save
Autocommit OFF → INSERT → record temporary
COMMIT; → record save
ROLLBACK; → record discard
*/


/*
select @@autocommit; 
insert into courses values(900 , "kamal" , "kamal khan") ; 
update courses set coursename = "regex" ; 
select * from courses ; 
commit ;    --> save hojayega fir rollback karne se koi fark nhi padega 
*/

 select @@autocommit ;
 set @@autocommit  = 1 ; 
 start transaction ; 
 insert into courses  values (911 , "kamal1" , "kamalkhan1") ; 
 
 create table tushar123(id int) ;  -- transaction is saved here 
 select * from tushar123; 
 select * from courses ; 
 
 
insert into courses values(913 , "b" , "bd"); 
update courses set coursename = "regex" where courseid = 913 ;  

select * from courses ; 
commit ; 
rollback ; 


start transaction ; 
insert into courses values(912 , "b" , "ab");
insert into courses values(914 , "b" , "bd");
savepoint courses_insert_chk ;
update courses set coursename  = "regex" where courseid = 913 ; 
rollback to  courses_insert_chk ; 
select * from courses ; 


-- DCL (DATA Control Language) 
-- Authentication  and authorization

select * from mysql.user; 
create user test identified by 'test123' ; 
create user yash identified by 'yash123' ; 
/*
select * from mysql.user; 
create user yash identified by 'yash123' ;
create database ecomarce ; 
create table customer ( id int , cnamevarchar(50)) ; 
insert into customer values (1 , "abhi") , (2 , 'naina') ; 
select * from customer ; 

grant all privilages on ecomarce.* from yash;
show grants for yash ; 
revoke  all privilages on ecomarce.* from yash ; 
*/
select * from mysql.user; 
create user pareek identified by '9588' ; 


create database ecomarce ; 
CREATE TABLE customer (
    id INT,
    cname VARCHAR(50)
);
insert into customer values (1 , "abhi") , (2 , 'naina') ; 
select * from customer ; 

GRANT ALL PRIVILEGES ON ecomarce.* TO 'pareek'@'%';
REVOKE ALL PRIVILEGES ON ecomarce.* FROM 'pareek'@'%';

use ecomarce  ; 
show tables ; 

use ecomarce ; 
GRANT SELECT (name, email) ON ecomarce.customers TO 'pareek'@'%';
grant select (id) on ecomarce.customer TO 'pareek'@'%';

select * from customer ; 
SHOW GRANTS FOR 'pareek'@'%';

GRANT USAGE ON *.* TO 'pareek'@'%' ; 
GRANT SELECT (`id`) ON `ecomarce`.`customer` TO 'pareek'@'%' ;


GRANT SELECT, UPDATE ON ecomarce.customer TO 'pareek'@'%';
FLUSH PRIVILEGES;

CREATE ROLE sales;
GRANT SELECT, UPDATE ON ecomarce.customer TO sales;
GRANT sales TO 'pareek'@'%';
GRANT sales TO 'aaditye'@'%';


