-- 1.Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.
create table orders(
order_id int primary key,
user_name varchar(20),
total_amount decimal(10,2),
order_date date);

insert into orders values
(1, 'Alice Smith', 150.50, '2026-06-01'),
(2, 'Bob Jones', NULL, '2026-06-03'),
(3, 'Charlie Brown', 45.00, '2026-06-10'),
(4, 'Diana Prince', 320.75, '2026-06-15'),
(5, 'Evan Wright', NULL, '2026-06-22');

-- 2.Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.
select user_name ,count(order_id) as order_count from orders
group by user_name;

-- 3.Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.
select avg(total_amount) from orders
where total_amount is not null;

-- 4.Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.
select min(total_amount) as lowest ,max(total_amount) as highest from orders;

-- 5.Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.<br><br><em><strong>Hint:</strong> Use a WHERE clause to filter out NULL values before applying the SUM function.</em>
select sum(total_amount) from orders
where total_amount is not null;
