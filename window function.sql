#Window function ऐसा function है जो calculation करता है लेकिन table की सभी rows को वैसा ही रखता है। Calculation का result एक 
#extra column में show करता है।
#जबकि Normal (aggregate) function calculation करता है और उस column की सभी rows को मिलाकर एक single result 
#या group-wise result देता है। इस case में original rows नहीं रहतीं।
#Ranking Functions
#ROW_NUMBER() → har row ko ek unique number deta hai.
-- RANK() → same value par same rank deta hai, aur agla rank skip ho jata hai.
-- DENSE_RANK() → same value par same rank deta hai, but agla rank skip nahi hota.
--  NTILE(n) → rows ko n buckets me divide karta hai.
-- Aggregate Window Functions
-- SUM(), AVG(), COUNT(), MIN(), MAX()
-- Ye group ke andar har row ke liye calculation kar dete hain.

-- Value Functions
-- LEAD() → next row ki value deta hai.
-- LAG() → previous row ki value deta hai.
-- FIRST_VALUE() → partition ka pehla value deta hai.
-- LAST_VALUE() → partition ka last value deta hai.


-- window function ka use ager hume har row ka average uske row ke samne dikhnta hai 
-- window function are also called alaystic function used to perform calculation on multiple rows in relastion to current row 
-- in aggergate function jo  OUTPUT THE MULTIPLE ARE GIVEN 	single row but here in window function 
-- each row is given with calculated data  (windows of row) ; 

create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

select avg(saleamount) from employeeSales ; 

select * , (select avg(saleamount) from employeeSales) from  employeeSales ;  

select department,avg(saleamount) from employeeSales
group by department ; 

