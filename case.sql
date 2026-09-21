-- 1.Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, using the Zomato Bangalore dataset.
select * from zomato_banglore
where location ='koramangala' and cuisine='north_indian'
order by rating desc
limit 5;

-- 2.Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines to eat in Bangalore.
select cuisine, 2*avg(amount) as avg_cost_for_2 from zomato_banglore
group by cuisine
order by avg_cost_for_2 desc
limit 3;

-- 3.Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to improve their ratings based on your findings.<br><br><em><strong>Hint:</strong> Look for patterns in location, cuisine, or price that might explain the low ratings.</em>
select restaurant_name,cuisine,amount,location from zomato_banglore
where rating <3 and home_delivery='yes';

-- 4.Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400), mid-range (400-800), and premium (above 800). Count how many restaurants fall into each segment.
with y as(

	with x as(
	select restaurant_name, 2*avg(amount) as avg_for2 from zomato_banglore
	group by restaurant_name
	)

	select *,
	case
		when avg_for2 <400 then 'budget'
		when avg_for2 between 400 and 800 then 'mid_range'
		when avg_for2 >800 then 'premium'
		end as 'segment' from x
)
select *,count(restaurant_name) as segment_count from y
group by segment;

-- 5.Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains (by number of outlets) in the dataset, then run and validate the query yourself.<br><br><em><strong>Hint:</strong> Search for 'SQL group by count example' if you get stuck.</em>
SELECT
    restaurant_name,
    COUNT(*) AS outlet_count
FROM zomato_banglore
GROUP BY restaurant_name
ORDER BY outlet_count DESC
LIMIT 10;