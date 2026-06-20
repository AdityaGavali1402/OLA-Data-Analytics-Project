create database ola;
use ola;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings As 
select * from bookings
where Booking_Status = "Success";

select * from Successful_Bookings;


-- 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as AVG_Ride_Distance from bookings
group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle;


-- 3. Get the total number of cancelled rides by customers:
create view TotalCancelRides_ByCustomer as
select count(*) as total_cancelled from bookings
where Booking_Status="Canceled by Customer";

select * from TotalCancelRides_ByCustomer;

	
-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers_book_highest_number_of_rides as
select Customer_ID, count(Booking_ID) as total_rides from bookings
group by Customer_ID
order by total_rides desc
limit 5;

select * from top_5_customers_book_highest_number_of_rides;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_ridesBydriver_DueTO_PC_issue as
select count(*) as total_cancel_by_driver from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";

select * from canceled_ridesBydriver_DueTO_PC_issue;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_ratings_for_PrimeSedan as
select Vehicle_Type, max(Driver_Ratings) as max_driver_ratings, min(Driver_Ratings) as min_driver_ratings from bookings
where Vehicle_Type="Prime Sedan";

select * from max_min_driver_ratings_for_PrimeSedan;


-- 7. Retrieve all rides where payment was made using UPI:
create view rides_with_UPI as
select Customer_ID, Payment_Method from bookings
where Payment_Method="UPI";

select * from rides_with_UPI;


-- 8. Find the average customer rating per vehicle type:
create view avg_cust_rating_per_vehicle as
select Vehicle_Type, avg(Customer_Rating) as avg_cust_rating from bookings
group by Vehicle_Type;

select * from avg_cust_rating_per_vehicle;


-- 9. Calculate the total booking value of rides completed successfully:
create view total_rides_completed_Successfully as
select Booking_Status, sum(Booking_Value) as total_bookingValue from bookings
where Booking_Status="Success";

select * from total_rides_completed_Successfully;


-- 10. List all incomplete rides along with the reason:
create view Incomplete_rides_with_reason as
select Booking_ID, Incomplete_Rides, Incomplete_Rides_Reason from bookings
where Incomplete_Rides="Yes";

select * from Incomplete_rides_with_reason;



