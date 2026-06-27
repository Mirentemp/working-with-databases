-- 1.Create a table called Restaurants with columns: id, name, cuisine, rating, and city. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.
create table restaurant(
id int primary key,
name varchar(30),
cuisine varchar(30),
rating decimal(2,1),
city varchar(30) );

INSERT INTO restaurant VALUES
(1, 'Piazza Nova', 'Italian', 4.5, 'New York'),
(2, 'Sakura Sushi', 'Japanese', 4.8, 'Los Angeles'),
(3, 'El Taco Loco', 'Mexican', 4.2, 'Austin'),
(4, 'Le Bistro', 'French', 4.6, 'Chicago'),
(5, 'The Curry House', 'Indian', 4.4, 'London'),
(6, 'Burger Crafters', 'American', 4.1, 'Miami'),
(7, 'Dim Sum Palace', 'Chinese', 4.3, 'San Francisco'),
(8, 'Olive Grove', 'Mediterranean', 4.7, 'Boston'),
(9, 'Zeus Gyros', 'Greek', 4.0, 'Seattle'),
(10, 'Bangkok Spice', 'Thai', 4.5, 'Denver');

-- 2.Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.
select name from restaurant
where rating >4.0 and city in ('ahmedabad','surat');

-- 3.Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em>
select name from restaurant
where name like 'swa%';

-- 4.Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).
select name from restaurant
where rating between 3.5 and 4.5;

-- 5.Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.
select name from restaurant
where cuisine in ('italian','chinese','south_indian');
