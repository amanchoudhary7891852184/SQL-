create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;
select * from departments;
-- employee have same salary as that  of theire department 
SELECT e.EmpID, e.EmpName, e.DeptID, e.Salary
FROM Employees e
JOIN (
    SELECT DeptID, AVG(Salary) AS avg_salary
    FROM Employees
    GROUP BY DeptID
) t
ON e.DeptID = t.DeptID AND e.Salary =  t.avg_salary;

-- co related subquery --> a correlated query is a sunquery which depend on outerquery 
-- is a sub query which depends on outer query and it is process for each row 
-- the nested query reapet  

SELECT e1.EmpID, e1.EmpName, e1.DeptID, e1.Salary
FROM Employees AS e1
WHERE e1.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees AS e2
    WHERE e1.DeptID = e2.DeptID
);
--
SELECT s.StudentID, s.StudentName, c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
--
SELECT s.StudentName, AVG(e.Grade) AS AvgGrade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.StudentName;

-- get the sudent id ,sudent name and the course name for the student who has enrolled 
-- get the student name and the average grade the persion has resived 
use regex1;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;


--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);
select s.studentID, s.studentname, c.coursename
from enrollments e
join students s on e.studentID = s.studentID
join courses c on e.courseID = c.courseID;
-- 
select s.studentName, AVG(e.Grade) 
from enrollments e
JOIN students s on e.studentID = s.studentID
group by s.studentName;

use sakila;
select * from payment;
select * from customer;
-- get the payment id the customer name the month the working day of month where the amount spend by the customer is grater than the average amount spended by the user it self 
-- only after the year 2004
select payment_id  , c.first_name , c.last_name , monthname(p.payment_date) as payment_month,
last_day(p.payment_date) as last_working_day,p.amount from payment p
join customer c on p.customer_id  = c.customer_id 
where p.amount > (select avg(p2.amount) from payment p2  
where p2.customer_id  = p.customer_id ) and year(p.payment_date) > 2004;

