
-- 1.Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.
create table Playlists (
    id int primary key,
    user_id int not null,
    playlist_name varchar(100) not null,
    total_likes int );

INSERT INTO Playlists (id, user_id, playlist_name, total_likes) VALUES
(1, 101, 'Chill Lo-Fi Beats', 1420),
(2, 101, 'Morning Run Energy', 530),
(3, 102, 'Rock Classics', 2890),
(4, 103, 'Acoustic Coffee Shop', 95),
(5, 104, 'Coding Focus', 4310),
(6, 104, 'Late Night Jazz', 720),
(7, 105, 'Bollywood Dance Hits', 8650),
(8, 101, 'Rainy Day Acoustic', 310); 

-- 2.Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.
select playlist_name,ROW_NUMBER() over(order by total_likes desc) from playlists;

-- 3.Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.
select playlist_name,user_id,total_likes, rank() over(order by total_likes desc) as rank_ from playlists;

-- 4.Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, total_likes, and dense rank.<br><br><em><strong>Hint:</strong> This will show how popular each playlist is within each user's account, similar to how Spotify might rank your top playlists.</em>
select * , dense_rank() over(partition by user_id order by total_likes desc) as d_rank from playlists;

-- 5.Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. Write a query using a window function to select only the top 2 playlists for each user.
with cte as (
select playlist_name, user_id,total_likes, rank()
over(partition by user_id order by total_likes desc) as rankk
from playlists
)
select * from cte where rankk <=2;
