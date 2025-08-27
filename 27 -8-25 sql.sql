use sakila ; 
use regex1 ;
create table test1(id int ,salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null); -- error here 

 
insert into test1 values(null,1881);
-- --------->-------------------------------------------------------------
-- defult -- > isme default value assign karte hai 
create table test2(id int default 0 ,salary int not null);
insert into test2 values(10,900);
insert into test2 (salary)values(1881); -- error here 
 
select * from test2 ;

-- unique ----------------------------------------------------------------->
create table test3(id int ,salary int default 100 unique) ; 
insert into test3 values(10,900);

insert into test3 (id)values(20012); 
insert into test3 values(10,900);
select * from test3 ;
create table test4(id int  primary key  ,salary int );
insert into test4 values(10,900);
-- Step 1: Create parent table (courses1) first
CREATE TABLE courses1 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- Step 2: Create child table with FK
CREATE TABLE studentinfo (
    sid INT PRIMARY KEY,
    sname VARCHAR(20),
    courseid INT,
    FOREIGN KEY (courseid) REFERENCES courses1(course_id)
);
insert into studentinfo values(1,"tushar",10);
insert into studentinfo values(2,"aman",11);
insert into studentinfo  values(3,"ama12n",13);
DROP TABLE studentinfo, courses1;
-- Parent tables
create table studentinfo (
    sid int,
    sname varchar(20),
    primary key (sid)
);

create table  courses1 (
    course_id int,
    course_name varchar(50),
    primary key (course_id)
);

 
create table student_course (
    sid int,
    course_id int,
    enrollment_date date,
    primary key (sid, course_id),  
    foreign key (sid) references studentinfo(sid),
    foreign key (course_id) references courses1(course_id)
);
insert into studentinfo values(1,"tushar",10);
insert into studentinfo values(2,"aman",11);
insert into studentinfo  values(3,"ama12n",13);

