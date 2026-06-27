-- 1.Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).
create table orders1(
order_id int primary key,
user_id int,
payment_method varchar(20),
amount decimal(10,2) );

insert into orders1 values
(101, 1, 'UPI', 250.00),
(102, 2, 'Card', 1450.75),
(103, 3, 'Wallet', 99.00),
(104, 4, 'COD', 620.00),
(105, 1, 'Card', 3100.50),
(106, 5, 'UPI', 85.00),
(107, 2, 'COD', 420.00),
(108, 6, 'Wallet', 150.25);

-- 2.Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.
select payment_method,count(*) from orders1
group by payment_method;

-- 3.Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.
select user_id,sum(amount) from orders1
group by user_id;

-- 4.Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>
select payment_method, avg(amount) as avg_amount from orders1
group by payment_method
having avg_amount >300;

-- 5.Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.

(WHERE)Scenario: You want to find the total money collected, but you want to completely ignore any individual order that is less than 500.

SELECT payment_method, SUM(amount) AS total_sales
FROM orders1
WHERE amount >= 500
GROUP BY payment_method;

(HAVING) Scenario: You want to see the total money collected for all payment methods, but you only want to display methods that brought in a combined total of more than 600.

SELECT payment_method, SUM(amount) AS total_sales
FROM orders1
GROUP BY payment_method
HAVING SUM(amount) > 600;
