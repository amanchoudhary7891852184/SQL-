use sakila ; 
select * , sum(saleamount) over (partition by employename) from employee81; 
select * from employee81; 
use tushar ; 

select * , sum(saleamount) over(order by employeeid)from employeeSales ; 
# (most importatnt question in mock 

# )
select * from employeeSales order by saleamount desc 
limit 1 , 1 ; 
# third higest second number nikalne ke liye 
SELECT MAX(saleamount) AS second_highest
FROM employeeSalesa
WHERE saleamount < (SELECT MAX(saleamount) FROM employeeSales);

SELECT * FROM (
SELECT EmployeeID, EmployeeName, Department, SaleDate, SaleAmount,
ROW_NUMBER() OVER (ORDER BY Department DESC) AS numbers FROM employeeSales
) t WHERE t.numbers = 10;

# row_number
select * ,  row_number() over(partition by department ) from employeesales ; 

select * ,  rank() over(order by saleamount desc) from employeesales ; 
#RANK() function rows ko order ke hisaab se rank deta hai, same value par same 
#rank aur agla rank skip ho jata hai. 
#RANK() function gives ranks to rows based on order, same values get the same rank and the 
# next rank is skipped

select * ,  rank() over(partition by department  order by  saleamount desc)
 from employeesales ; 
 
 select * ,  dense_rank() over(partition by department  order by  saleamount desc)
 from employeesales ; 
 
#dense_rank same to same value par same rank and next rank skip ho jati hai 

select * ,  dense_rank() over(partition by department  order by  saleamount desc) as `rank`
 from employeesales ; 
 
select * ,  dense_rank() over(partition by department  order by  saleamount desc) as `rank`
 from employeesales ; 
 
with ranks as (select * ,  dense_rank() over(order by  saleamount desc) as `rank`
 from employeesales)
 select * from employeesales 
where rank  = 2 ; 

WITH ranks AS (SELECT *,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY SaleAmount DESC) AS `rank`
FROM employeeSales)
SELECT * FROM ranks
WHERE `rank` = 2;

-- lag and lead
select * , lead(saleamount) over() from employeesales ; 

# 2 value aage 
select * , lead(saleamount , 2) over() from employeesales ; 

select * , lag(saleamount ) over() from employeesales ;
insert into employeesales values(1,'alice' , 'sales' , '2025-06-2' , 600.00) ; 
select *, lag(saleamount) over(partition by department, employeename),
saleamount - lag(saleamount) over(partition by department, employeename) from employeesales;

select *, 
saleamount - lag(saleamount) over(partition by department, employeename order by saledate)
 from employeesales where employeename = 'alice' ; 


with datedi as (
select *, 
lag(saledate) over(partition by department, employeename order by saledate)
 from employeesales where employeename = 'alice'  and department = 'sales')

select * from date datedi
where datediff(saledate - lead(saledate))  = 1 ; 

 
select *,
lead(saledate) over(partition by department,employeename order by saledate) as nextdate,
datediff(lead(saledate) over(partition by department,employeename order by saledate),saledate)
from employeesales where employeename='alice' and department='sales';
 
