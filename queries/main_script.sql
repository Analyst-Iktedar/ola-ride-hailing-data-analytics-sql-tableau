#1. Retrieve all successful bookings:
Create View ola_project_dataset.successful_bookings As
SELECT * FROM ola_project_dataset.bookings
WHERE booking_status = 'Success';

#2. Find the average ride distance for each vehicle type:
Create View ola_project_dataset.ride_distance_for_each_vehicle As
SELECT vehicle_type, AVG(ride_distance)
as avg_distance FROM ola_project_dataset.bookings
GROUP BY vehicle_type;

#3. Get the total number of cancelled rides by customers:
Create View ola_project_dataset.cancelled_rides_by_customers As
SELECT COUNT(*) AS no_of_cancelled_rides FROM ola_project_dataset.bookings
WHERE booking_status = 'Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
Create View ola_project_dataset.top_5_customers As
SELECT customer_id, COUNT(booking_id) as total_rides
FROM ola_project_dataset.bookings
GROUP BY customer_id
ORDER BY total_rides DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View ola_project_dataset.rides_cancelled_by_drivers_p_c_issues As
SELECT COUNT(*) AS no_of_cancelled_rides FROM ola_project_dataset.bookings
WHERE canceled_rides_by_driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View ola_project_dataset.max_min_driver_rating As
SELECT 
  MAX(driver_ratings) as max_rating,
  MIN(driver_ratings) as min_rating
FROM 
  ola_project_dataset.bookings 
WHERE 
  vehicle_type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View ola_project_dataset.upi_payment As
SELECT * FROM ola_project_dataset.bookings
WHERE payment_method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create View ola_project_dataset.avg_cust_rating As
SELECT vehicle_type, AVG(customer_rating) as avg_customer_rating
FROM ola_project_dataset.bookings
GROUP BY vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
Create View ola_project_dataset.total_successful_ride_value As
SELECT SUM(booking_value) as total_successful_ride_value
FROM ola_project_dataset.bookings
WHERE booking_status = 'Success';

#10. List all incomplete rides along with the reason:
Create View ola_project_dataset.incomplete_rides_reason As
SELECT booking_id, incomplete_rides_reason
FROM ola_project_dataset.bookings
WHERE incomplete_rides = true;



#                              --Anwers--

#1. Retrieve all successful bookings:
SELECT * FROM ola_project_dataset.successful_bookings;

#2. Find the average ride distance for each vehicle type:
SELECT * FROM ola_project_dataset.ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
SELECT * FROM ola_project_dataset.cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM ola_project_dataset.top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM ola_project_dataset.rides_cancelled_by_drivers_p_c_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM ola_project_dataset.max_min_driver_rating;

#7. Retrieve all rides where payment was made using UPI:
SELECT * FROM ola_project_dataset.upi_payment;

#8. Find the average customer rating per vehicle type:
SELECT * FROM ola_project_dataset.avg_cust_rating;

#9. Calculate the total booking value of rides completed successfully:
SELECT * FROM ola_project_dataset.total_successful_ride_value;

#10. List all incomplete rides along with the reason:
SELECT * FROM ola_project_dataset.incomplete_rides_reason;




