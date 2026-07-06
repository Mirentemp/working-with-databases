#session 14

-- 1.Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. Insert at least 7 sample rows representing different users and dates, similar to how food orders appear in Zomato or Swiggy.
create table orders(
order_id int primary key,
user_id int not null,
order_date date not null,
total_Amount decimal(10,2)
);
insert into orders values
(1001, 105, '2026-06-25', 450.50),
(1002, 102, '2026-06-25', 270.00),
(1003, 108, '2026-06-26', 125.75),
(1004, 101, '2026-06-27', 890.00),
(1005, 105, '2026-06-28', 350.25),
(1006, 109, '2026-06-29', 199.90),
(1007, 102, '2026-06-30', 540.50);

-- 2.Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their previous order (if any), ordered by user and date.<br><br><em><strong>Hint:</strong> Use PARTITION BY user_id and ORDER BY order_date in your window function.</em>
select *,
lag(total_amount) over(partition by user_id order by order_date) as previous_order
from orders;

-- 3.Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date, and the next order's total_amount for the same user.
select user_id,order_id,order_date,
lead(total_amount) over(partition by user_id order by order_date) as next_amount
from orders;

-- 4.Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount, and a column running_total that accumulates the sum as you move through each user's orders.<br><br><em><strong>Hint:</strong> Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).</em>
select user_id,order_id,order_date,total_amount,
sum(total_amount) over(partition by user_id order by order_date rows between unbounded preceding and current row) as running_total
from orders;

-- 5.Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date, total_amount, and moving_avg columns.<br><br><em><strong>Constraint:</strong> Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to compute the moving average.</em>
select user_id,order_id, order_date, total_amount,
avg(total_amount)
over(partition by user_id order by order_date rows between 1 preceding and 1 following) as moving_avg
from orders;