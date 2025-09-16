create database gst ; 
use gst ; 
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
amount DECIMAL(10,2)
);
-- Insert 25 Records
INSERT INTO Orders (order_id, customer_id, order_date, amount) VALUES

(1, 101, '2024-01-05', 250.00),
(2, 102, '2024-01-15', 400.00),
(3, 101, '2024-02-10', 180.00),
(4, 103, '2024-02-12', 500.00),
(5, 102, '2024-03-01', 700.00),
(6, 101, '2024-03-05', 300.00),
(7, 104, '2024-03-20', 150.00),
(8, 103, '2024-04-01', 450.00),
(9, 105, '2024-04-15', 320.00),
(10, 101, '2024-04-20', 280.00),
(11, 106, '2024-05-02', 600.00),
(12, 102, '2024-05-10', 750.00),
(13, 104, '2024-05-15', 200.00),
(14, 103, '2024-06-01', 550.00),
(15, 105, '2024-06-10', 400.00),
(16, 106, '2024-06-20', 620.00),
(17, 101, '2024-07-05', 310.00),
(18, 102, '2024-07-10', 720.00),
(19, 104, '2024-07-20', 180.00),
(20, 103, '2024-08-01', 470.00),
(21, 105, '2024-08-15', 390.00),
(22, 106, '2024-08-25', 640.00),
(23, 101, '2024-09-05', 350.00),
(24, 102, '2024-09-10', 710.00),
(25, 104, '2024-09-20', 210.00);

select * from orders ; 

-- 5. Find orders that are placed on weekends (Saturday/Sunday).
select * from orders where dayofweek(order_date) in (1,7) ;

-- 4. Find orders placed on the latest order date in the table
select orders from orders 
WHERE order_date = (SELECT MAX(order_date) FROM Orders);

SELECT * FROM Orders
WHERE order_date = (SELECT MAX(order_date) FROM Orders); 
-- 2. Find orders that are greater than the average amount in March 2024 in hinid mtlb
-- मार्च 2024 में जितने भी ऑर्डर हुए हैं, उनमें से सिर्फ वही ऑर्डर दिखाओ जिनकी रकम (amount) मार्च 2024 के औसत (average) से ज्यादा है।”
SELECT * FROM Orders
WHERE order_date >= '2024-03-01' AND order_date < '2024-04-01' 
AND amount > (SELECT AVG(amount) FROM Orders
     WHERE order_date >= '2024-03-01' AND order_date < '2024-04-01');

SELECT AVG(amount) FROM Orders
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-31'; 

SELECT * FROM Orders
where amount > (select AVG(amount) FROM Orders
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-31'
) ; 

select * from orders 
where order_date BETWEEN '2024-03-01' AND '2024-03-31'  and amount > (select AVG(amount) FROM Orders
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-31'
) ; 

-- 2,4,5
-- जिन ग्राहकों का कुल ख़र्च (सभी ऑर्डरों का जोड़) सभी ग्राहकों के औसत ख़र्च से ज़्यादा है, उन्हें दिखाओ।
-- Hint SQL: प्रति ग्राहक SUM(amount) बनाओ, फिर उनका AVG(total_spend) लेकर total_spend > overall_avg चुनो।


select customer_id  , sum(amount) as total  from orders 
group by customer_id 
having total  > (select avg(amount) as total  from orders ) ; 

-- total amount by each customer 
select customer_id from (select customer_id  , sum(amount) as total  from orders 
group by customer_id ) as temp ; 

select * from 
(select * from sakila.actor
where first_name = 'NICK') as t 
where actor_id = 44 ;

select * from (select customer_id  , sum(amount) as total  from orders 
group by customer_id ) as temp 
where total > (select avg(amount) from orders) ; 


-- फ़रवरी 2024 में जिन ग्राहकों ने अपनी पहली ऑर्डर की थी, उन्हें निकालो।
-- Hint SQL: ग्राहकों की पहली तारीख (MIN(order_date)) निकालकर फ़रवरी 2024 में आने वालों को फ़िल्टर करो।
-- 1. Get customers who placed their first order in February 2024
WITH first_orders AS (
  SELECT customer_id, MIN(order_date) AS first_date
  FROM Orders
  GROUP BY customer_id
)
SELECT customer_id, first_date
FROM first_orders
WHERE first_date >= '2024-02-01' AND first_date < '2024-03-01';

select * from orders ; 

SELECT customer_id, MIN(order_date) AS first_date
FROM Orders
GROUP BY customer_id
HAVING   MIN(order_date) >= '2024-02-01'
   AND MIN(order_date) <  '2024-03-01';

select customer_id , min(order_date) from orders where month(order_date)= 2 and year(order_date) = 2024 ; 

select customer_id , order_date from orders as o where order_Date = 
(select min(order_date) from orders as ot where o.customer_id = ot.customer_id and month(order_date)=2);

-- हर महीने में सबसे ज़्यादा रकम वाली ऑर्डर(ज़) निकालो (टाई होने पर सभी)।
-- 6. Find the order(s) with the highest amount in each month.

SELECT * FROM Orders 
WHERE amount = (SELECT MAX(amount) FROM Orders
WHERE YEAR(order_date)  = YEAR(o.order_date)
AND MONTH(order_date) = MONTH(o.order_date)
); 
select  max(amount) , YEAR(order_date) ,MONTH(order_date)  from orders
group by  YEAR(order_date) , MONTH(order_date) ; 


SELECT * FROM Orders o
WHERE amount = ( SELECT MAX(amount) FROM Orders
WHERE YEAR(order_date) = YEAR(o.order_date) AND MONTH(order_date) = MONTH(o.order_date));


-- join , subquuery , groupby 