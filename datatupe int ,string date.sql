-- dataTYPE
-- int (4 byte) 2**
create table yash1(id int unsigned) ;
insert into yash1 values(-10); 
select * from yash11 ; 

-- tiny int(1 byte)
--  small int (2 byte) mediumbyte (3 byte00)
 -- big int ( 2**64)
 
create table yash11(id bigint unsigned) ;
insert into yash11 values(80465446461231); 

-- Data Type	Signed Range	Unsigned Range
-- TINYINT	-128 to 127	0 to 255
-- SMALLINT	-32,768 to 32,767	0 to 65,535
-- MEDIUMINT	-8,388,608 to 8,388,607	0 to 16,777,215
-- INT (or INTEGER)	-2,147,483,648 to 2,147,483,647	0 to 4,294,967,295
-- BIGINT	-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807	0 to 18,446,744,073,709,551,615

drop table yash1 ; 
create table yash1(name char(10)) ;
insert into yash1 values('abc'); 

select  length('hey abc') , char_length('hey abc') ; 
-- length => bytes count karta hai english me har charcter me 1 bytes ka hota hai
-- char_length  = > charecter count karta hai

-- char => fixed size length 
-- varchar => variable length charcter 
 create table yash1(name ,varchar(10)); 
insert into yash1 values('abc             ') ; 

select length(name) from yash1 ; 

drop table yash1 ; 
 create table yash1(dob date); 
insert into yash1 values('2026-01-12') ;  -- yyy-mm-dd
insert into yash1 values('2026-15-30') ; -- incorrect 
select * from yash1 ; 

-- 
insert into yash1 values(now()) ;


-- timestamp
 create table yash1(dob timestamp); 
insert into yash1 values(now() );
select * from yash1 ; 

create table yash4(do date);
insert into yash4 values(curdate());

select * from yash4 ; 
-- timestamp --> 1970-01-01 se 2038 tak data store kr sakta hai => 4byte store karta hai 

-- date time --> kuch bhi date add kar sakte hai 8byte ye datetime dono store karta hai
-- blob => binary large object binary data and is used to binary data suc h as image audio , video , or any other type of file in a database

create table yash5(salary float);  # decimal value 4 to 5 hi aati hai
insert into yash5 values(504455.10456 );
select * from yash5 ; 

create table yash7(salary double);  # jayda decimal value store kar sakte hai
insert into yash7 values(10.25),(504455.10456 );
select * from yash7 ; 


-- what is difrence  float and double 
--  float 4 byte , double  8 byte
--  flat fast hota hai , decimal slow hota hai 
-- integer ko precision khate hai
create table yash8(salary double(5,2));  # jayda decimal value store kar sakte hai
insert into yash8 values(505.104);
insert into yash8 values(505.104); -- error here as 3 scalaer values are allowed
select * from yash8 ;