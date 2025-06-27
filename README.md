# Project Title Statement
This Power BI project, "Sales Data Analysis," aims to provide comprehensive insights into booking and ride data to understand performance, identify trends, and uncover opportunities for improvement in service delivery and customer satisfaction.

# Objective
The primary objective of this project is to transform raw booking data into actionable insights, enabling stakeholders to make data-driven decisions. Key areas of focus include:
- Analyzing booking trends over time.
- Evaluating the performance of different vehicle types.
- Understanding reasons for canceled and incomplete rides.
- Assessing the impact of driver and customer ratings on booking success.
- Identifying popular pickup and drop locations.
- Tracking booking values and payment methods.

# Tech Stack Used
- Power BI: For data modeling, DAX measure creation, and report visualization.
- Power BI Dataflow: Used to import and prepare data from the raw CSV files for use in the Power BI report.
- SQL Server: Used for querying and analyzing the data
- Microsoft Excel / CSV: As the primary data source for booking records.

# Different DAX Measures
- Total Bookings: COUNTROWS(Bookings)
- Total Successful Bookings: CALCULATE(COUNTROWS(Bookings), Bookings[Booking_Status] = "Success")
- Total Canceled Bookings: CALCULATE(COUNTROWS(Bookings), OR(Bookings[Booking_Status] = "Canceled by Customer", Bookings[Booking_Status] = "Canceled by Driver", Bookings[Booking_Status] = "Driver Not Found"))
- Average Booking Value: AVERAGE(Bookings[Booking_Value])
- Average Ride Distance: AVERAGE(Bookings[Ride_Distance])
- Cancellation Rate (by Customer): DIVIDE(CALCULATE(COUNTROWS(Bookings), Bookings[Booking_Status] = "Canceled by Customer"), COUNTROWS(Bookings))
- Cancellation Rate (by Driver): DIVIDE(CALCULATE(COUNTROWS(Bookings), Bookings[Booking_Status] = "Canceled by Driver"), COUNTROWS(Bookings))

# Feature Descriptions of the Dataset
The dataset primarily consists of booking records with the following key features:
- Date & Time: Timestamp of the booking.
- Booking_ID: Unique identifier for each booking.
- Booking_Status: Current status of the booking (e.g., "Success," "Canceled by Driver," "Canceled by Customer," "Driver Not Found").
- Customer_ID: Unique identifier for each customer.
- Vehicle_Type: Type of vehicle requested (e.g., "Prime Sedan," "Bike", "Mini", "Auto" etc.).
- Pickup_Location & Drop_Location: Geographic locations for ride origin and destination.
- V_TAT & C_TAT: Time metrics (Vehicle Turnaround Time & Customer Turnaround Time).
- Canceled_Rides_by_Customer & Canceled_Rides_by_Driver: Reasons for cancellation, if applicable.
- Incomplete_Rides & Incomplete_Rides_Reason: Indicates if a ride was incomplete and the reason.
- Booking_Value: The monetary value of the booking.
- Payment_Method: How the booking was paid (e.g., "Cash," "UPI," "Credit Card").
- Ride_Distance: The distance of the ride.
- Driver_Ratings & Customer_Rating: Ratings provided by drivers and customers.

# Key Visuals
- KPI Cards: A set of cards displaying key performance indicators (KPIs) like Total Bookings, Total Booking Value, Total Canceled Rides etc. providing a quick overview of performance.
- Bookings & Value Trend: A line chart that tracks Total Bookings vs. Total Booking Value over time, allowing for a clear view of trends and seasonality.
- Booking Status Distribution: A donut chart visualizing the proportion of bookings by their Booking Status (e.g., Success, Canceled by Driver, Canceled by Customer), which helps in understanding the success rate.
- Booking Value by Payment Method: A bar chart illustrating the Total Booking Value for different Payment Methods (e.g., Cash, UPI), which helps identify payment preferences and revenue streams.
- Ride Outcome Breakdown: A stacked bar chart that breaks down number of Incomplete Rides and Complete Rides By Vehicle Type.
- Ride Failure Reasons: Donut Charts that breaks down Customer and Driver Cancelled Rides by reason (e.g., Customer Related Issue, Driver Asked to Cancel etc.)

# Insights Found
- Dominant Booking Trend: The line chart shows a clear trend of bookings and booking value over time, with a noticeable drop in the second half of the month, indicating a potential decrease in demand or service activity.
- Significant Ride Failures: The KPI cards and the stacked bar chart highlight that a substantial number of rides are either incomplete or canceled by the driver or customer. The donut chart provides a critical insight into the primary reasons for these failures.
- Vehicle Type Performance: The "Prime Sedan" appears to be the most frequently booked vehicle type, followed by "Mini" and "Bike," suggesting these are the most popular options for customers.
- Cash is King: "Cash" appears to be the dominant payment method in terms of total booking value, followed by "UPI," indicating customer preference for these payment options.
- High Cancellation & Incomplete Rate: Out of approx 1,00,000 total bookings, 28K were canceled and 4K were incomplete, resulting in a cancellation rate of approximately 28% and an incomplete ride rate of about 3.9%. This suggests a significant portion of booking attempts are not resulting in completed rides.

# Dashboard Screenshots
![image](https://github.com/user-attachments/assets/7a7a8ffb-e9ac-4c88-b4a7-202fea89ad1a)
![image](https://github.com/user-attachments/assets/01939b52-13d3-401e-b5ef-db6793d2c021)
![image](https://github.com/user-attachments/assets/8c26f66a-0f4d-4cd7-a64b-993bcfbfcfa3)
![image](https://github.com/user-attachments/assets/40f9e4a4-255d-413f-87f5-23b69b748dae)



