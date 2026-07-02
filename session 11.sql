#session 11

-- 1.Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.
select restaurant_name,rating from restaurants
where rating > (select avg(rating) from restaurants);

-- 2.Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.
select user_name,
	(select count(order_id) from orders o
    where u.user_id=o.user_id) as ttl_orders
from users u;

-- 3.Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.
select id,title from movies
where id in (select id,rating from reviews 
			where rating =5);

-- 4.Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.
select seller_id, count(catagory)
from products
group by seller_id
having count(catagory) =(select count(distinct catagory) from products);