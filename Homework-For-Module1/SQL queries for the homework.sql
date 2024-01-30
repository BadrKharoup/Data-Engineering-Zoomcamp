-- This is the SQL queries used in the homework
-- Question 3
SELECT COUNT(*) AS total_trips
FROM public.green_taxi_data
WHERE DATE(lpep_pickup_datetime) = '2019-09-18';

-- Question 4
SELECT DATE(lpep_pickup_datetime) AS pickup_day,
       SUM(trip_distance) AS total_trip_distance
FROM public.green_taxi_data
GROUP BY pickup_day
ORDER BY total_trip_distance DESC
LIMIT 1;

-- Question 5
SELECT "PUBorough" AS PickupBorough,
       SUM(total_amount) AS TotalAmount
FROM green_taxi_data
WHERE DATE(lpep_pickup_datetime) = '2019-09-18'
  AND "PUBorough" <> 'Unknown'
GROUP BY "PUBorough"
HAVING SUM(total_amount) > 50000
ORDER BY TotalAmount DESC
LIMIT 3;

-- Question 6
SELECT "DOZone" AS dropoff_zone,
       MAX(tip_amount) AS max_tip_amount
FROM green_taxi_data
WHERE "PUZone" = 'Astoria'
GROUP BY "DOZone"
ORDER BY max_tip_amount DESC
LIMIT 1;







