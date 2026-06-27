-- 1.Install MySQL Community Server or SQLite on your system and verify the installation by connecting to the database using the command line or a GUI tool like MySQL Workbench or DB Browser for SQLite.
done
-- 2.Create a new database named 'foodie_app' to simulate a Zomato-style backend.
create database foodie_app;

-- 3.Write a CREATE TABLE statement to define a 'restaurants' table in the 'foodie_app' database with the following columns: id (integer, primary key), name (varchar/character, max 100), cuisine (varchar/character, max 50), rating (decimal, e.g., 4.5), and location (varchar/character, max 100).
create table restaurants(
id int primary key,
name varchar(30),
cuisine varchar(30),
rating decimal(2,1),
location varchar(30)  );

-- 4.Design and create a 'users' table for a Flipkart-style app with columns: user_id (primary key), username, email, phone_number, and created_at (date/time). Pick appropriate data types for each column.<br><br><em><strong>Hint:</strong> Think about which columns should be unique and which data types best fit email and phone numbers.</em>
create table users(
user_id int primary key,
username varchar(30),
email varchar(50),
phone_number int,
created_at timestamp );

-- 5.Intentionally make a mistake in your CREATE TABLE statement (such as missing a comma or using an unsupported data type), run it, and then fix the error based on the message you receive.<br><br><em><strong>Hint:</strong> Take a screenshot of the error and the corrected SQL statement for your records.</em>
create table users(
user_id int primary key,
username varchar,          -- missing limit of varchar :varchar(30)
email varchar(50),
phone_number int,
created_at timestamp );
