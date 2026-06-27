-- 1.Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.
create table restaurants(
restaurant_id int primary key,
name varchar(50),
city varchar(50) );

create table dishes(
id int primary key,
restaurant_id int,
dish_name varchar(50),
price int ,
foreign key (restaurant_id) references restaurants(restaurant_id)
);

insert into restaurants values
(1, 'Giny V Yami', 'Ahmedabad'),
(2, 'The Grand Thakar', 'Rajkot'),
(3, 'Toscana', 'Vadodara');

insert into dishes values
(1,1, 'Spicy Paneer Tikka', 249.00),
(2,1, 'Veg Manchurian', 199.00),
(3,2, 'Kathiyawadi Thali', 350.00),
(4,2, 'Sev Tameta Nu Shak', 150.00),
(5,2, 'Bajri No Rotlo', 50.00),
(6,3, 'Margherita Pizza', 450.00),
(7,3, 'Penne Alfredo', 399.00);

-- 2.Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.
select d.dish_name,r.name,r.city from restaurants R
join dishes d
on r.restaurant_id=d.restaurant_id;

-- 3.Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>
select r.name,d.dish_name from restaurants r
left join dishes d
on r.restaurant_id=d.restaurant_id;

-- 4.Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).
select r.name,d.dish_name from restaurants r
right join dishes d
on r.restaurant_id=d.restaurant_id;

-- 5.Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.
left join
