create database 2nd_tast; 

SELECT * FROM 2nd_tast.`hotel reservation dataset`;

use 2nd_tast;
## 1. What is the total number of reservations in the dataset? 

SELECT COUNT(*) AS Booking_ID
FROM `hotel reservation dataset`;


## 2. Which meal plan is the most popular among guests? 

SELECT type_of_meal_plan, COUNT(*) AS count
FROM `hotel reservation dataset`
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;

## 3. What is the average price per room for reservations involving children? 

SELECT AVG(avg_price_per_room) AS avg_price_per_room
FROM `hotel reservation dataset`
WHERE no_of_children > 0;


## 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
 
 SELECT COUNT(*) AS Booking_ID
FROM `hotel reservation dataset`
WHERE YEAR(arrival_date) = 2017;

SELECT COUNT(*) AS Booking_ID
FROM `hotel reservation dataset`
WHERE arrival_date BETWEEN '2017-01-01' AND '2018-12-31';

## 5. What is the most commonly booked room type? 

SELECT room_type_reserved, COUNT(*) AS count
FROM `hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

## 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 

SELECT COUNT(*) AS no_of_weekend_nights
FROM `hotel reservation dataset`
WHERE no_of_weekend_nights > 0;

## 7. What is the highest and lowest lead time for reservations? 

SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM `hotel reservation dataset`;

## 8. What is the most common market segment type for reservations? 

SELECT market_segment_type, COUNT(*) AS count
FROM `hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;


## 9. How many reservations have a booking status of "Confirmed"? 

SELECT COUNT(*) AS confirmed_reservations
FROM `hotel reservation dataset`
WHERE booking_status = 'Not_Canceled'
;

## 10. What is the total number of adults and children across all reservations? 

SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM `hotel reservation dataset`;

## 11. What is the average number of weekend nights for reservations involving children? 

SELECT AVG(no_of_weekend_nights) AS average_weekend_nights
FROM `hotel reservation dataset`
WHERE no_of_children > 0;


## 12. How many reservations were made in each month of the year?

SELECT 
    MONTH(arrival_date) AS month,
    COUNT(*) AS reservation_count
FROM `hotel reservation dataset`
GROUP BY MONTH(arrival_date)
ORDER BY month;

## 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

SELECT room_type_reserved,
       AVG(CASE WHEN DAYOFWEEK(check_out_date) IN (1,7) THEN DATEDIFF(check_out_date, check_in_date) + 1 ELSE DATEDIFF(check_out_date, check_in_date) END) AS average_nights
FROM `hotel reservation dataset`
GROUP BY room_type_reserved;


## 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 

SELECT room_type_reserved, AVG(avg_price_per_room) AS average_price
FROM `hotel reservation dataset`
JOIN rooms r ON Booking_ID = Booking_ID
WHERE res.no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

## 15. Find the market segment type that generates the highest average price per room.
 
SELECT market_segment_type, AVG(avg_price_per_room) AS average_price_per_room
FROM `hotel reservation dataset`
