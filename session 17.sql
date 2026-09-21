-- 1.Create a SQL table called Restaurant with columns: id, name, cuisine, location, and average_rating. Insert at least 5 sample rows representing popular restaurants from Zomato.
create table restaurant(
id int primary key,
name varchar(50),
cuisine varchar(50),
location varchar(50),
average_rating decimal(2,1)
);

insert into restaurant values
(1, 'Barbeque Nation', 'North Indian', 'Connaught Place, Delhi', 4.5),
(2, 'Peter Cat', 'Continental', 'Park Street, Kolkata', 4.7),
(3, 'Toscano', 'Italian', 'UB City, Bengaluru', 4.4),
(4, 'Britannia & Co.', 'Parsi', 'Fort, Mumbai', 4.6),
(5, 'Rameshwaram Cafe', 'South Indian', 'Indiranagar, Bengaluru', 4.8);

-- 2.Write a SQL query to generate a report showing the number of restaurants for each cuisine type from your Restaurant table, ordered by the count in descending order.<br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY.</em>
select cuisine,count(name) as total_count from restaurant
group by cuisine
order by total_count desc;

-- 3.Add a new table called Review with columns: id, restaurant_id, user_name, rating, and review_date. Insert at least 10 sample reviews, linking them to restaurants using restaurant_id.
create table review(
id int primary key,
restaurant_id int,
user_name varchar(50),
rating decimal(2,1),
review_date timestamp default CURRENT_TIMESTAMP,
foreign key (restaurant_id) references restaurant(id)
);

insert into review values
(1, 1, 'Rahul Sharma', 4.5, '2026-09-01 19:30:00'),
(2, 1, 'Priya Patel', 4.0, '2026-09-03 14:15:00'),
(3, 2, 'Ananya Sen', 5.0, '2026-09-05 21:00:00'),
(4, 2, 'Amit Biswas', 4.5, '2026-09-06 13:00:00'),
(5, 3, 'Vikram Rao', 4.0, '2026-09-10 20:45:00'),
(6, 3, 'Sneha Reddy', 4.5, '2026-09-12 12:30:00'),
(7, 4, 'Zayan Khan', 5.0, '2026-09-14 18:20:00'),
(8, 4, 'Meera Joshi', 4.0, '2026-09-15 15:10:00'),
(9, 5, 'Karthik N', 5.0, '2026-09-18 09:00:00'),
(10, 5, 'Deepa Balan', 4.5, '2026-09-20 20:00:00');

-- 4.Write a SQL query using a JOIN to display each restaurant's name, cuisine, and its average review rating (from the Review table), ordered by highest average rating first.<br><br><em><strong>Hint:</strong> Use JOIN and GROUP BY with aggregate functions.</em>
select r.name,r.cuisine,avg(r1.rating) as avg_rating from restaurant r
join review r1
on r.id=r1.restaurant_id
group by r1.restaurant_id
order  by avg_rating desc;

-- 5.Use a window function to rank restaurants by their average review rating within each cuisine type, showing the restaurant name, cuisine, average rating, and rank.<br><br><em><strong>Hint:</strong> Use the RANK() or DENSE_RANK() window function partitioned by cuisine.</em>
select 
r.name, r.cuisine, avg(r1.rating) as avg_rating,
dense_rank() over(partition by r.cuisine order by avg(r1.rating) desc) as cuisine_rank
from restaurant r
join review r1 
on r.id = r1.restaurant_id
group by r.id, r.name, r.cuisine;