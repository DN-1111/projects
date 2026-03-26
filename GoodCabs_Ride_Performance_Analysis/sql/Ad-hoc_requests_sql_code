use trips_db;

 
 -- 1. CITY LEVEL FARE AND TRIP SUMMARY REPORT
 
 SELECT 
    city_name,
    COUNT(trip_id) AS total_trips,
    ROUND(SUM(fare_amount) / SUM(distance_travelled_km),2) AS avg_fare_per_km,
    ROUND(AVG(fare_amount),2)AS avg_fare_per_trip,
    ROUND(COUNT(trip_id) / (SELECT 
            COUNT(*)
        FROM
            fact_trips) * 100,2) AS perc_contri_to_total_trips
FROM
    dim_city
        JOIN
    fact_trips USING (city_id)
GROUP BY city_name
ORDER BY COUNT(trip_id);




-- 2.MONTHLY CITY LEVEL TRIPS TARGET PERFORMANCE REPORT

WITH Actual_trips AS (
       SELECT
        c.city_name,
        d.month_name,
        COUNT(t.trip_id) AS actual_trips                 
    FROM trips_db.fact_trips t
    JOIN trips_db.dim_city c USING(city_id)
    JOIN trips_db.dim_date d USING(date) 
    GROUP BY c.city_name, d.month_name
),
Target_trips AS (
       SELECT
        c.city_name,
        d.month_name,
        SUM(total_target_trips) AS target_trips                
    FROM targets_db.monthly_target_trips m
    JOIN trips_db.dim_city c USING(city_id)
    JOIN trips_db.dim_date d ON d.date = m.month   
    GROUP BY c.city_name, d.month_name)

SELECT 
    at.city_name,
    at.month_name,
    at.actual_trips,
    tt.target_trips,
	ROUND((actual_trips - target_trips) / (target_trips) * 100,2) AS percentage_difference,
	CASE 
		WHEN actual_trips > target_trips THEN 'Above Target'
		ELSE 'Below Target'
        END AS performance_status
FROM Actual_trips at
JOIN Target_trips tt
ON at.city_name = tt.city_name AND at.month_name = tt.month_name
ORDER BY at.city_name, at.month_name;





-- 3.CITY LEVEL REPEAT PASSENGER TRIP FREQUENCY REPORT

SELECT 
    city_name,
    ROUND(SUM(CASE WHEN trip_count = 2 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "2-Trips",
    ROUND(SUM(CASE WHEN trip_count = 3 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "3-Trips",
    ROUND(SUM(CASE WHEN trip_count = 4 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "4-Trips",
    ROUND(SUM(CASE WHEN trip_count = 5 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "5-Trips",
    ROUND(SUM(CASE WHEN trip_count = 6 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "6-Trips",
    ROUND(SUM(CASE WHEN trip_count = 7 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "7-Trips",
    ROUND(SUM(CASE WHEN trip_count = 8 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "8-Trips",
    ROUND(SUM(CASE WHEN trip_count = 9 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "9-Trips",
    ROUND(SUM(CASE WHEN trip_count = 10 THEN repeat_passenger_count ELSE 0 END) * 100.0 /
        SUM(repeat_passenger_count), 2) AS "10-Trips"
FROM dim_repeat_trip_distribution 
LEFT JOIN dim_city
USING(city_id)
GROUP BY city_name;






-- 4.CITIES WITH HIGHEST AND LOWEST TOTAL NEW PASSENGERS
  
WITH CTE  AS 
(
SELECT city_name,SUM(new_passengers) AS Total_new_passengers,
				RANK() OVER (ORDER BY SUM(new_passengers) DESC) AS rnk
FROM fact_passenger_summary 
JOIN dim_city 
USING (city_id)
GROUP BY city_name)

SELECT city_name,Total_new_passengers,
CASE
     WHEN rnk < 4  THEN 'TOP 3'
     WHEN rnk > 7 THEN 'BOTTOM 3' 
END  AS City_category
FROM CTE
WHERE rnk < 4 OR rnk > 7;






-- 5.MONTH WITH HIGHEST REVENUE FOR EACH CITY 


WITH monthly_revenue AS (
	SELECT 
        c.city_name,
        d.month_name,
        SUM(t.fare_amount) AS monthly_revenue
    FROM 
        fact_trips t
          LEFT JOIN 
	dim_date d USING(date)
		  LEFT JOIN 
	dim_city c USING(city_id)
    GROUP BY c.city_name, d.month_name
),
total_revenue AS (
    SELECT 
        city_name,
        month_name,
        monthly_revenue,
        SUM(monthly_revenue) OVER (PARTITION BY city_name) AS total_city_revenue,
        ROW_NUMBER() OVER (PARTITION BY city_name ORDER BY monthly_revenue DESC) AS revenue_rnk
       FROM monthly_revenue
)
SELECT 
    city_name,
    month_name AS "Highest_Revenue_Month",
    monthly_revenue AS Revenue,
    ROUND((monthly_revenue / total_city_revenue) * 100, 2) AS Percent_Contribution
FROM total_revenue
WHERE revenue_rnk = 1
ORDER BY city_name;



-- 6.REPEAT PASSENGER RATE ANALYSIS 

WITH month_rate AS (
        SELECT
        c.city_name,
        d.month_name AS month,
        SUM(total_passengers) AS total_passengers,
        SUM(repeat_passengers) AS repeat_passengers,
       ROUND((SUM(repeat_passengers) / SUM(total_passengers)) * 100,2) AS monthly_repeat_passenger_rate
    FROM fact_passenger_summary f
    JOIN dim_city c USING (city_id)
    JOIN dim_date d ON f.month = d.date
    GROUP BY c.city_name, d.month_name
),
City_rate AS (
        SELECT
        c.city_name,
        SUM(total_passengers) AS total_passengers,
        SUM(repeat_passengers) AS repeat_passengers,
		ROUND((SUM(repeat_passengers) / SUM(total_passengers)) * 100,2) AS city_repeat_passenger_rate
    FROM fact_passenger_summary f
    JOIN dim_city c ON f.city_id = c.city_id
    GROUP BY c.city_name
)

SELECT
    m.city_name,
    m.month,
    m.total_passengers,
    m.repeat_passengers,
    m.monthly_repeat_passenger_rate,
    c.city_repeat_passenger_rate
FROM month_rate m
JOIN city_rate c USING(city_name)
ORDER BY m.city_name, m.month;
