-- Check if booking id be the primary key
ALTER TABLE booking
    ADD PRIMARY KEY (booking_id)

-- Checking for duplicates	
SELECT COUNT(*), COUNT(DISTINCT booking_id), COUNT( DISTINCT customer_id)
FROM booking


SELECT * FROM booking WHERE booking_id IN
(
SELECT booking_id
FROM booking
GROUP BY booking_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC
);

-- Adding new column to be the primary key 
ALTER TABLE booking
ADD COLUMN id SERIAL PRIMARY KEY;

-- Remove "" from customer and booking id
UPDATE booking
SET booking_id = REPLACE(booking_id, '"', '');

UPDATE booking
SET customer_id = REPLACE(customer_id, '"', '');


SELECT *
FROM booking
LIMIT 10;

-- Check for NULL values 
SELECT 
    COUNT(*) FILTER (WHERE booking_date IS NULL) AS null_booking_date,
    COUNT(*) FILTER (WHERE booking_time IS NULL) AS null_booking_time,
    COUNT(*) FILTER (WHERE booking_id IS NULL) AS null_booking_id,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
    COUNT(*) FILTER (WHERE vehicle_type IS NULL) AS null_vehicle_type,
    COUNT(*) FILTER (WHERE pickup_location IS NULL) AS null_pickup,
    COUNT(*) FILTER (WHERE drop_location IS NULL) AS null_drop
FROM booking;

-- Analysis Queries
-- Total number of of different rides 
SELECT booking_status,COUNT(*) AS num_of_rides
FROM booking 
GROUP BY 1
ORDER BY 2 DESC

-- Types of Payment Methods
SELECT payment_method, COUNT(*) AS count_methods
FROM booking 
GROUP BY 1
ORDER BY 2 DESC

-- Avg of (booking_value , time to arrive , time to drop ,driver and customer rating, distance)
SELECT 
    ROUND(AVG(avg_vtat), 2)       AS avg_vtat,
    ROUND(AVG(avg_ctat), 2)       AS avg_ctat,
    ROUND(AVG(booking_value), 2)  AS avg_booking_value,
    ROUND(AVG(ride_distance), 2)  AS avg_ride_distance,
    ROUND(AVG(driver_rating), 2)  AS avg_driver_rating,
    ROUND(AVG(customer_rating), 2) AS avg_customer_rating
FROM booking;

-- The most active customer 
SELECT customer_id, COUNT(*)
FROM booking
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

--Revenue by month 
SELECT EXTRACT(MONTH FROM booking_date) , ROUND(AVG(booking_value),1)
FROM booking
GROUP BY 1
ORDER BY 2 DESC
