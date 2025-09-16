create database college;
show databases;
USE college;
create table student(
 student_id int primary key,
    first_name varchar(50),
    age int,
    phone_number varchar(15),
    prices decimal(10,2),
    discount decimal(10,2),
    date_of_birth date
);
show tables;
INSERT INTO student (
    student_id,
    first_name,
    age,
    phone_number,
    prices,
    discount,
    date_of_birth
) 
VALUES
(5, 'Rohit', 20, '1234567890', 100.00, 10.00, '2003-01-01'),
(6, 'Saurabh', 22, '0987654321', 150.00, 15.00, '2001-02-02'),
(7, 'Purushottam', 19, '1112233445', 120.00, 5.00, '2004-03-03'),
(8, 'Guddu', 21, '5566778899', 130.00, 20.00, '2002-04-04');

SELECT * FROM student;