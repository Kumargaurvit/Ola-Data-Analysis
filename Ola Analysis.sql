CREATE DATABASE OLA;

USE OLA;

-- 1. Retrieve all successful bookings
Select * from bookings where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type
Select Vehicle_Type, AVG(Ride_Distance) as [Average Ride Distance] from Bookings Group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers
Select Count(*) as [Number of rides cancelled by customers] from bookings where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides
Select TOP 5 Customer_ID, Count(Booking_ID) as [No of Rides] from Bookings
Group BY Customer_ID
Order by Count(booking_id) desc;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
Select Count(*) as [No of Rides Cancelled] from Bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Select MAX(Driver_Ratings) as [Maximum Rating], MIN(Driver_Ratings) as [Minimum Rating] 
from bookings
Where Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
Select Count(*) as [Rides_Upi_Payment] from bookings
Where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type
Select Vehicle_Type, AVG(Customer_Rating) [Average Customer Rating] from bookings
Group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully
Select SUM(booking_value) [Total Booking Value of successful rides] from Bookings
Where Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason
Select Customer_ID, Booking_ID, Incomplete_Rides_Reason from Bookings
Where Incomplete_Rides = 1;

-- 11. Find number of bookings per booking status
Select Booking_status, Count(*) as [No. Of Bookings]
From Bookings 
Group By Booking_Status;

-- 12. Get average booking value per vehicle type
Select Vehicle_Type, AVG(Booking_value) as [Avg Booking Value]
From Bookings 
Group By Vehicle_Type;

-- 13. Calculate average driver and customer ratings by vehicle type
Select Vehicle_Type, AVG(Driver_ratings) as [Avg Driver Rating], 
AVG(Customer_rating) as [Avg Customer Rating] 
From bookings
Group By Vehicle_Type;

-- 14. Calculate customer lifetime value (LTV) for top 10 customers
Select Top 10 Customer_id, SUM(Booking_value) as [Customer Lifetime Value] 
from bookings
WHERE Booking_Status = 'Success'
Group By Customer_ID
Order By [Customer Lifetime Value] Desc;

-- 15. Compare average TAT (Turnaround Time) between successful and canceled rides
Select Booking_Status, AVG(V_TAT) as [Average Vehicle TAT], AVG(C_TAT) as [Average Customer TAT] 
From bookings
WHERE V_TAT is not null AND C_TAT is not null
Group By Booking_Status;

-- 16. Find top pickup-drop pairs that yield the highest average booking value
Select TOP 10 Pickup_Location, Drop_Location, AVG(Booking_value) as [Avg Booking Value] 
From bookings
GROUP BY Pickup_Location, Drop_Location
ORDER BY [Avg Booking Value] DESC;

-- 17. Ratio of successful to canceled bookings per vehicle type
Select Vehicle_Type,
SUM(CASE When Booking_Status = 'Success' THEN 1 ELSE 0 END) AS sucess_count,
SUM(CASE When Booking_Status LIKE 'Canceled%' THEN 1 ELSE 0 END) AS canceled_count
from bookings
Group By Vehicle_Type;