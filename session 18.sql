-- 1.Write an SQL query to display the total number of songs uploaded by each artist from a table 'songs' (columns: song_id, artist_name, title) and show only those artists who have uploaded more than 3 songs.
select artist_name,count(song_id) as total_songs from songs
group by artist_name
having count(song_id) >3;

-- 2.Given two tables, 'orders' (order_id, user_id, amount) and 'users' (user_id, username), write a SQL JOIN query to display each username along with their total order amount.
select u.username,sum(o.amount) as total_amount from users u
join orders o
on u.user_id=o.user_id
group by o.user_id;

-- 3.Write a SQL subquery to find the names of all restaurants from a 'restaurants' table (id, name, rating) whose rating is higher than the average rating of all restaurants.
select id,name,rating from restaurants
where rating > (select avg(rating) from restaurants);

-- 4.Using a 'transactions' table (id, user_id, amount, transaction_date), write a SQL query with a window function to display each user's transaction amount and their running total (cumulative sum) ordered by transaction_date.
select user_id,amount,
	sum(amount)
	over(partition by user_Id order by transaction_date 
		 rows between unbounded preceding and current row) as running_ttl
from transactions;

-- 5.List two optimizations you would apply to speed up a query that filters Flipkart products by category and price, and briefly explain how each helps.<br><br><em><strong>Hint:</strong> Think about indexes and query structure.</em>
 1:'by creating index on (category,price)'
 2:'filtering data using where clause'