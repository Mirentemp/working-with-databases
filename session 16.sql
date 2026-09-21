-- 1.import a CSV file of food delivery orders (with columns like order_id, restaurant_name, customer_name, order_amount, order_date) into a new SQL table named FoodOrders using your database tool of choice.
create table FoodOrders (
    order_id int primary key,
    restaurant_name varchar(255),
    customer_name varchar(255),
    order_amount decimal(10, 2),
    order_date date
);

-- 2.Write SQL statements to create a table called TopSongs with columns: song_id, song_title, artist, streams, and release_date, then insert at least 5 records representing popular tracks from Spotify.
create table topsongs (
song_id int primary key,
song_title varchar(50),
artist varchar(50),
streams int,
release_date date );

insert into topsongs values
(1, 'Blinding Lights', 'The Weeknd', 4400000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 4000000000, '2017-01-06'),
(3, 'Starboy', 'The Weeknd', 3500000000, '2016-09-21'),
(4, 'As It Was', 'Harry Styles', 3400000000, '2022-04-01'),
(5, 'Someone You Loved', 'Lewis Capaldi', 3500000000, '2018-11-08');

-- 3.Write an SQL query to find the top 3 customers who ordered the most from the FoodOrders table based on total order_amount, and display their names and total spent.
select customer_name,sum(order_amount) as total_spending from foodorders
group by customer_name
order by total_spending desc
limit 3;

-- 4.Generate a product performance report by writing an SQL query that lists each restaurant_name from FoodOrders, the number of orders, and the total order_amount, ordered by total order_amount descending.<br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY clauses.</em>
select restaurant_name,count(order_id) as total_orders,sum(order_amount) as total_amount
from foodorders
group by restaurant_name
order by total_amount desc;

-- 5.Create an SQL query that calculates two KPIs for the FoodOrders table: (1) average order_amount and (2) total number of unique customers, and format the output for dashboard display (two columns: kpi_name, kpi_value)
select 'avg order amount' as kpi_name,
		avg(order_amount) as kpi_value
from foodorders

union all

select 'total unique customers' as kpi_name,
		count(distinct customer_name) as kpi_value
from foodorders;