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

-- -----------------------------------------------------------------------------
-- primary key 

create table test4(id int primary key  ,salary int default 100 unique) ;  
insert into test4 values(10,900);

insert into test4 (id)values(20012); 
insert into test4 values(11,810);
select * from test4 ;

-- >--------------------------------------------------------------------
CREATE TABLE studentinfo (
    sid INT PRIMARY KEY,
    sname VARCHAR(20),
    courseid INT,
    FOREIGN KEY (courseid) REFERENCES courses1(course_id)
);
DESC courses1;
ALTER TABLE courses1 ADD PRIMARY KEY (course_id);
create table courses1(course_id int PRIMARY KEY , cname varchar(20)) ;
insert into studentinfo values(1,'tushar' , 11) ; 

select * from studentinfo ;
SELECT * FROM courses1;

INSERT INTO courses1 (course_id, cname) VALUES (11, 'Any Course');

INSERT INTO studentinfo (sid, sname, courseid)
VALUES (1, 'tushar', 11);

INSERT INTO courses1 (course_id, cname) VALUES (12, 'Data Scienece');

insert into studentinfo values(2,'Mohit' , 12) ; 

select * from studentinfo ;
SELECT * FROM courses1;

-- do columns  ke combination se primary ki or do table  ke bichn

-- > >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--------------------------------
CREATE TABLE A (
    a_id INT PRIMARY KEY,
    a_name VARCHAR(50)
);

CREATE TABLE B (
    b_id INT PRIMARY KEY,
    b_name VARCHAR(50)
);


CREATE TABLE C (
    c_id INT PRIMARY KEY,         -- Primary Key
    c_name VARCHAR(50),
    a_id INT,                     -- Foreign Key referencing A
    b_id INT,                     -- Foreign Key referencing B
    FOREIGN KEY (a_id) REFERENCES A(a_id),
    FOREIGN KEY (b_id) REFERENCES B(b_id)
);


INSERT INTO A VALUES (1, 'Alpha'), (2, 'Beta');
INSERT INTO B VALUES (10, 'X'), (20, 'Y');

INSERT INTO C VALUES (100, 'Test1', 1, 10),
                     (101, 'Test2', 2, 20);
                     
select * from A ; 
select * from B ; 
select * from C ; 

CREATE TABLE S (
    S_id INT,
    s_code INT,
    s_name VARCHAR(50),
    PRIMARY KEY (S_id, S_code)     -- Composite Primary Key
);

CREATE TABLE T (
    T_id INT PRIMARY KEY,
    T_name VARCHAR(50),
    S_id INT,
    S_code INT,
    FOREIGN KEY (S_id, S_code) REFERENCES S(S_id, S_code)
);

INSERT INTO S VALUES (1, 101, 'Alpha'), (2, 202, 'Beta');
-- Child table me data (sirf wahi S_id, S_code chalega jo S me hai)
INSERT INTO T VALUES (100, 'Test1', 1, 101);
INSERT INTO T VALUES (101, 'Test2', 2, 202);


select * from S ; 
select * from T ; 