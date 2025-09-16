-- table creation (ddl), dml 
use sakila ; 
-- table ko object bola jata hai
-- datatype - > int ,float , double string[varchar , char]
create table studentaccess(id int , sname varchar(10));
insert into studentaccess values (9,'abc') ; --dml
insert into studentaccess (id , sname) values(9,'abc') ; -- columns ke sath define karne ka tarika 

-- problem
insert into studentaccess values (9) ; -- error because two columns but we give value one
select * from studentaccess ; 
SELECT * FROM studentaccess;

-- problem
insert into studentaccess (id) values(9) ;
insert into studentaccess (id , sname) values(19,'abc') ; 
drop table studentaccess ; 
-- ddl -> create ,  drop 
insert into studentaccess values (9,'abc') ;

create table studentaccess(id int , sname varchar(22));
insert into studentaccess (id) values(22) ; 
insert into studentaccess (sname) values('yash') ; 
select * from studentaccess ; 

-- 1 row update with where clause ; 
update studentaccess set sname = 'raj' ; 
update studentaccess set sname = 'abhishek' 
where id = 22 ; 
-- where id and id 20 konsa bhi opertor lega sakte hai 
-- drop se columns table sab kuch ht jayge structure ht jayega 
update studentaccess set id = 23 
where sname = 'raj' ; 

delete from studentaccess ; 
select * from studentaccess ; 
insert into studentaccess (id , sname) values(22 , 'yash') ; 
insert into studentaccess (id , sname) values(23 , 'yash') ; 
delete from studentaccess  -- dml 
where id = 22 ; -- between bhi use kar sakte the 
select * from studentaccess ; 
-- merge musql me use nhi hota hai 
-- merge - dml ka statement 
/*
case 
     when condition then expression
else
end 

-- merge * table when condition match the
-- merge into targettable  as t 
-- using refrencetable condition then statment (insert/update/delete)

meger is dml languguge 
-- truncat -- table structure ko yaad rakhna bas data delete karna 
-- truncate helps you retain the structire of the table by just deleting the data of the table not the table structure
trucate table studentaccess ; 
create table test18(id tinyint);
insert into test18 value(10);
insert into test18 value(-128);

insert into test18 value(-129);  -- size is smaller 1 byte 2^8 256 (-128 to 127)

select * from test18;

create table test19(id tinyint unsigned);  -- all number positive (255)
insert into test19 value(10);
insert into test19 value(-128);

-- small int, medium int int(size=4), big int(size=8)
9950966386 - tanish sharma regex 
aggrete 
