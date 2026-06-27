-- 1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.
create database music_streaming_app;

-- 2. Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).
create table playlists(
playlist_id int primary key,
name varchar(20),
created_by varchar(20)
);

-- 3. Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.
insert into playlists values
(1,'bollywood_hits','amit'),
(2,'chiil_vibes','dhruvil'),
(3,'workout_mix','sahil');

-- 4. Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.<br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>
select * from playlists
where created_by='amit';

-- 5. Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.
**Table:** A collection of related data stored in rows and columns.

**Row (Record):** A single entry in a table.

**Column (Field):** A category of data in a table.

### Example (Zomato Restaurants Table)

| restaurant_id | restaurant_name | city      |
| ------------- | --------------- | --------- |
| 1             | Spice Hub       | Ahmedabad |
| 2             | Pizza Point     | Surat     |

* **Table:** `Restaurants`
* **Row:** `1 | Spice Hub | Ahmedabad` (one restaurant s details)
* **Column:** `restaurant_id`, `restaurant_name`, `city` (types of information stored)

**In short:**
📋 **Table** = Entire Restaurants list
📄 **Row** = One restaurant s data
📌 **Column** = One attribute (ID, Name, City, etc.) of all restaurants.
