-- 1.Create a table called Playlist with columns: id (INT, primary key), song_name (VARCHAR), artist (VARCHAR), and duration (INT, seconds). Insert a single row for your current favorite song.
create table playlist(
id int primary key,
song_name varchar(50),
artist varchar(50),
duration int );

INSERT INTO Playlist values
(1, 'Gehra Hua', 'Arijit Singh & Shashwat Sachdev', 248);

-- 2.Insert 3 new rows into the Playlist table for songs you recently listened to on Spotify, including their song_name, artist, and duration.
insert into playlist values
(2, 'Tauba Tauba', 'Karan Aujla', 207),
(3, 'Aayi Nai', 'Sachin-Jigar & Pawan Singh', 178),
(4, 'Saiyaara', 'Tanishk Bagchi & Faheem Abdullah', 239);

-- 3.Update the artist name for one of your Playlist entries to fix a typo (for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE statement with a WHERE clause.
update playlist set artist='karan aujla' where id=2;

-- 4.Delete a song from the Playlist table where the duration is less than 120 seconds using the DELETE statement and a WHERE clause.<br><br><em><strong>Hint:</strong> Make sure your WHERE clause is specific so you don’t accidentally delete all rows.</em>
delete from playlist 
where duration <120;

-- 5.Write an SQL statement that would update the song_name for all songs by 'AP Dhillon' in your Playlist to add '(Remix)' at the end of the name, but only if the duration is more than 180 seconds.<br><br><em><strong>Constraint:</strong> Combine UPDATE with WHERE to target only the correct rows.</em>Update song names for AP Dhillon tracks longer than 180 seconds
UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'AND duration > 180;
