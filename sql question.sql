create database tem ;
use tem ; 
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade INT,
    City VARCHAR(50)
);

INSERT INTO Students (StudentID, Name, Age, Grade, City) VALUES
(1, 'Alice', 14, 9, 'New York'),
(2, 'Bob', 15, 10, 'Los Angeles'),
(3, 'Charlie', 14, 9, 'Chicago'),
(4, 'David', 16, 11, 'New York'),
(5, 'Eve', 15, 10, 'Chicago');

CREATE TABLE Marks (
    StudentID INT,
    Subject VARCHAR(50),
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Marks (StudentID, Subject, Marks) VALUES
(1, 'Math', 85),
(1, 'Science', 90),
(2, 'Math', 78),
(2, 'Science', 95),
(3, 'Math', 88),
(3, 'Science', 89),
(4, 'Math', 84),
(4, 'Science', 70),
(5, 'Math', 92),
(5, 'Science', 98);

-- 1 Get the student name with the starting 3 character from name in a column name as select for grade >= 9.
select * from Students ; 
select * from marks ; 
select left(name ,3) as name_char from Students
where grade >= 9 ; 

-- Find the marks of all subjects for the student named "Charlie" with 10% grace marks in a new column.
select Subject ,  marks from marks ;
select * from student ; 
select * from marks ; 

SELECT Subject, Marks, (Marks * 1.1) AS GraceMarks FROM Marks
WHERE StudentID = (SELECT StudentID FROM Students WHERE Name = 'Charlie');

-- 3  List the names of students who scored more than 90 in Science.
select s.name from students s
join marks m on s.studentid = m.studentid 
where m.subject = 'science' and marks >= 90 ; 
-- Find the total marks scored by each student across all subjects.

select s.name , sum(m.marks) as totalmarks from students s
join marks m on s.studentid = m.studentid 
group by s.name ; 

-- Display the name and total marks of the top-scoring student in Science.
 

select s.name , sum(marks) as totalmarks from students s
join marks m on s.studentid = m.studentid
where subject = 'science'  
group by s.name 
order by totalmarks desc
limit 1 ; 

-- List all students who have scored more than the average marks in Math.
select * from marks ; 
select * from students ;
select s.name , m.marks from students s
join marks m on s.StudentID = m.StudentID
where m.subject = 'math' and m.marks > (select avg(marks) from marks WHERE Subject = 'Math'
  );

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE,
    manager_id INT
);
INSERT INTO Employees (emp_id, emp_name, department, salary, joining_date, manager_id) VALUES
(1, 'Alice Johnson', 'IT', 75000, '2018-06-15', 5),
(2, 'Bob Smith', 'HR', 60000, '2019-08-10', 6),
(3, 'Charlie Brown', 'Finance', 82000, '2017-02-25', 5),
(4, 'David Williams', 'IT', 72000, '2020-11-20', 5),
(5, 'Emma Wilson', 'IT', 95000, '2016-04-12', NULL),
(6, 'Franklin Adams', 'HR', 58000, '2021-09-01', NULL),
(7, 'Grace Kelly', 'Finance', 91000, '2018-03-12', 6);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    rating INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Projects (project_id, emp_id, project_name, start_date, end_date, rating) VALUES
(101, 1, 'AI Implementation', '2021-01-10', '2021-12-15', 5),
(102, 2, 'Recruitment Analysis', '2021-03-01', '2021-09-30', 6),
(103, 3, 'Budget Forecasting', '2019-04-15', '2020-02-25', 4),
(104, 4, 'Cloud Migration', '2020-12-05', '2021-05-20', 3),
(105, 1, 'Cybersecurity Audit', '2022-01-10', '2022-11-30', 5),
(106, 5, 'System Upgrade', '2018-06-15', '2019-03-22', 4),
(107, 6, 'Employee Training', '2020-01-15', '2020-12-31', 3),
(108, 7, 'Financial Risk Model', '2019-10-10', '2021-09-30', 5);


select * from projects ; 

# 1 Find employees who have the lowest salary in the company.
select * from employees 
where salary  = (select min(salary) from employees ) ; 

# 2. Find the department with the highest average salary.
select department , avg(salary) as jsalary  from employees
group by department  
order by jsalary desc
limit 1 ; 

# 3 Find the name of the manager of "Alice Johnson".
select * from Employees ; 
select e.emp_name as employee ,j.emp_name as mangername  from employees e
join employees j on  e.manager_id = j.emp_id 
where e.emp_name  =  "Alice Johnson" ; 

# 4. Get the total number of projects completed per employee, 
# sorted by the highest count. 
select emp_id ,count(*)  from projects 
group by emp_id 
order by count(*) desc ; 

# 5 Calculate the running total of salaries in the company based on joining date.
select * from employees ; 


select emp_id,emp_name,salary,joining_date, sum(salary*month(joining_date)) as total_salary from employees 
group by emp_id ; 

# Find the number of employees who joined after 2018.
select count(emp_id) as total from employees
where joining_date >= 2018-01-01 ;

-- #  Find the total number of projects handled by each employee.
select * from projects ; 

select e.emp_id , count(p.project_id) as total_project from employees e
left join projects p on e.emp_id = p.emp_id
group by e.emp_id ; 

-- Q8.Find employees whose salary is above the average 
-- salary of their department.
select * from employees ; 
select emp_id , emp_name , department , salary from employees e
where salary > (select avg(salary) from employees  where department = e.department ) ;

# Q9. Find the employee id, name, and department who don’t have any manager. 
select emp_id, emp_name, department from employees
where manager_id is null ; 


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    genre VARCHAR(30),
    price DECIMAL(6,2) NOT NULL,
    publication_year INT
);

INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 15.99, 2019),
(2, 'Where the Crawdads Sing', 'Delia Owens', 'Mystery', 17.99, 2018),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 21.50, 2018),
(4, 'The Midnight Library', 'Matt Haig', 'Fiction', 22.00, 2020),
(5, 'Educated', 'Tara Westover', 'Memoir', 17.25, 2018),
(6, 'Becoming', 'Michelle Obama', 'Memoir', 25.50, 2018),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 12.99, 1988);

select * from books ; 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(8,2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(101, 1, 'John Doe', '2023-01-15', 1, 15.99),
(102, 2, 'Jane Smith', '2023-02-10', 2, 35.98),
(103, 3, 'Alice Johnson', '2023-03-05', 1, 21.50),
(104, 4, 'Robert Brown', '2023-04-12', 2, 44.00),
(105, 5, 'Sophia Wilson', '2023-05-20', 3, 51.75),
(106, 6, 'David Williams', '2023-06-18', 2, 51.00),
(107, 7, 'Emma Davis', '2023-07-25', 1, 12.99),
(108, 1, 'Olivia Martin', '2023-08-30', 2, 31.98),
(109, 2, 'Ethan Taylor', '2023-09-15', 1, 17.99),
(110, 3, 'Mia Moore', '2023-10-22', 2, 43.00),
(111, 6, 'Daniel Garcia', '2023-11-11', 3, 76.50),
(112, 7, 'Lucas White', '2023-12-03', 2, 25.98);

# Q1. Find the most expensive book in the store.
select * from books 
order by price desc
limit 1 ; 

# Q2. Find books whose price is higher than the average 
# price of books in the same genre.
select * from books ; 

select title ,author , price from books e
where price > (select avg(price) from books where genre = e.genre) ; 

# Q3. Find the total revenue generated by each author.
select b.author ,sum(o.total_price) as total_revenve from orders o 
join books b on o.book_id  = b.book_id
group by b.author ; 

# Q4. Provide the rank of books based on the price.
select * from books ; 
select book_id , title , author , price ,rank() over (order by price desc)from books ; 

# Q5. Compute the running total of revenue from book sales over time.
select * from orders ; 
select order_id ,order_date ,total_price ,sum(total_price) OVER (ORDER BY order_date) AS running_revenue from orders
group by order_id ; 

# Q6. Find books written by the same author.
SELECT author, GROUP_CONCAT(title) AS books_written
FROM Books
GROUP BY author
HAVING COUNT(*) > 1;


