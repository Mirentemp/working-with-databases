#session 12

-- 1.Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table, similar to how Flipkart or Myntra might highlight top-rated items.
with cte as
( select product_name,rating from products) 
select * from cte;

-- 2.Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table, first using a subquery and then using a CTE. Compare both queries for readability.<br><br><em><strong>Hint:</strong> Focus on making the CTE version cleaner and easier to understand.</em>
select * from 
(select restaurant_name from restaurants
where city='ahmedabad' and del_charge <50) subquery;

with cte as
(select restaurant_name from restaurants
where city='ahmedabad' and del_charge <50)
select * from cte;

-- 3.Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and 'Posts' table (think Instagram-style data). Output both lists in the same result set.
with 
cte1 as
	(select user_id,followers,'users' as role from users
	order by followers desc
	limit 3),
cte2 as
	(select post_id,likes,'post' as role from posts
    order by likes desc
    limit 3)
select * from cte1
union ALL
select * from cte2;

-- 4.Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow shows available dates for movie bookings.
with recursive next7days as (
    select curdate() as booking_date

    union all
    select booking_date + interval 1 day
    from next7days
    where booking_date < curdate() + interval 6 day
)
select booking_date
from next7days;

-- 5.Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.
with cte as
(select user_id,followers from users
where followers >1000)
select * from cte;