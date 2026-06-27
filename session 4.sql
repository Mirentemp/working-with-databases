-- 1.Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.
create table musicplaylist(
id int primary key,
song_name varchar(20),
artist varchar(20),
genre varchar(20),
duration time);

insert into musicplaylist values
(1, 'Shape of You', 'Ed Sheeran', 'Pop', '00:03:54'),
(2, 'Believer', 'ImagineDrag', 'Rock', '00:03:24'),
(3, 'Perfect', 'Ed Sheeran', 'Pop', '00:04:23'),
(4, 'Blinding Lig', 'Weeknd', 'Pop', '00:03:20'),
(5, 'Thunder', 'ImagineDrag', 'Rock', '00:03:07'),
(6, 'Levitating', 'Dua Lipa', 'Pop', '00:03:23'),
(7, 'Senorita', 'ShawnMendes', 'Latin', '00:03:11'),
(8, 'Faded', 'Alan Walker', 'EDM', '00:03:32'),
(9, 'Stay', 'Kid Laroi', 'Pop', '00:02:21'),
(10, 'Happier', 'Marshmello', 'EDM', '00:03:34');

select * from musicplaylist;

-- 2.Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.
select song_name,artist from musicplaylist
limit 3;

-- 3.Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.
select distinct restaurant from foodorders;

-- 4.Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.
select food_item as 'dish' ,order_date as 'date_ordered' from foodorders;

-- 5.You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>
select distinct food_item, restaurant
from FoodOrders
order by food_item
limit 2;
