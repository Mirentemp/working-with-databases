-- 1.Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.
create table influencers(
id int primary key,
name varchar(50) );

create table collaborations(
id int primary key,
influencer1_id int,
influencer2_id int,
collab_date date );

select i1.name as Influencer_1, i2.name as Influencer_2, c.collab_date
from Collaborations c
left join Influencers i1 on c.influencer1_id = i1.id
left join Influencers i2 on c.influencer2_id = i2.id

union

select i1.name as Influencer_1, i2.name as Influencer_2, c.collab_date
from Collaborations c
right join Influencers i1 on c.influencer1_id = i1.id
right join Influencers i2 on c.influencer2_id = i2.id;

-- 2.Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>
select p1.playlist_name,p2.playlist_name
from playlists p1
join playlists p2
on p1.parent_playlist_id=p2.id;

-- 3.Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.
select u.username,o.order_date,p.amount
from users u
left join orders o on u.id=o.user_id
left join payments p on p.order_id=o.id;

-- 4.You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>
select distinct z.restaurant_name from zomato_restaurants z
left join reviews r
on z.restaurant_id=r.restaurant_id;

-->> #Duplicates occur because a single restaurant can have multiple reviews,causing the database to repeat the restaurant s name for every matching review row found in the joined table

-- 5.Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.
select p.product , c.category from products p
join categories c                          -- >>inner join 
on p.category_id=c.id

select p.product , c.category from products p
left join categories c                          -- >>left join 
on p.category_id=c.id
