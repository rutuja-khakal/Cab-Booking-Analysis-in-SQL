create database cab_bookings;
use cab_bookings;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Gender VARCHAR(10),
    City VARCHAR(50)
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Rating DECIMAL(3,2)
);

CREATE TABLE Cabs (
    CabID INT PRIMARY KEY,
    DriverID INT,
    vehicleType Varchar(20),
    PlateNumber varchar(20),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    CabID INT,
    BookingDate DATETIME,
    Status VARCHAR(20),  -- Completed, Cancelled, Pending
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

CREATE TABLE TripDetails (
    TripID INT PRIMARY KEY,
    BookingID INT,
    Distance_KM DECIMAL(5,2),
    Duration_Min INT,
    BaseFare DECIMAL(10,2),
    Taxes DECIMAL(10,2),
    TotalFare DECIMAL(10,2),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(20),
    PaymentDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

## Insert Customers
INSERT INTO Customers (CustomerID, Name, Email, Phone, Gender, City) VALUES
(1, 'Amanda Taylor', 'tammie17@yahoo.com', '994-785-6214', 'Female', 'New Robert'),
(2, 'Kyle Hall', 'crystal77@hotmail.com', '327.928.4170', 'Male', 'Lake Dorothyborough'),
(3, 'Heather Norman', 'ymorgan@gmail.com', '350.537.3494', 'Female', 'Fowlerstad'),
(4, 'Rebecca Evans', 'charliejohnson@gmail.com', '756-907-8356', 'Male', 'Melissaview'),
(5, 'Benjamin Sandoval', 'howardbenjamin@yahoo.com', '275.269.0666', 'Female', 'North Staceyland'),
(6, 'Samantha May', 'kristenward@gmail.com', '172.442.3053', 'Female', 'Port Christopher'),
(7, 'Steven Barnes', 'stephanie98@hotmail.com', '188-792-6903', 'Male', 'Port Catherine'),
(8, 'Michelle Curtis', 'monicasalazar@hotmail.com', '074.869.8665', 'Male', 'Davisfort'),
(9, 'Mark Rodriguez', 'johnsonmichael@gmail.com', '536.052.7736', 'Female', 'Port Garyshire'),
(10, 'Timothy Smith', 'paulmartinez@hotmail.com', '825-748-7076', 'Female', 'North Gregory'),
(11, 'Angela Garcia', 'bwilliamson@gmail.com', '074.362.1869', 'Male', 'West Scottmouth'),
(12, 'Rebecca Wolfe', 'ginaanderson@hotmail.com', '293-078-1001', 'Female', 'Christopherstad'),
(13, 'Erik Walker', 'wellsbrittany@yahoo.com', '535-843-9869', 'Male', 'Lake Jennifer'),
(14, 'Bradley Davis', 'walterskayla@hotmail.com', '124.280.3665', 'Female', 'Port William'),
(15, 'Kimberly Harrison', 'kelsey47@gmail.com', '155-625-9263', 'Female', 'North Rhonda'),
(16, 'Erika Patel', 'barbara23@yahoo.com', '422.196.6568', 'Male', 'South Amanda'),
(17, 'Lisa Olson', 'stewartcassandra@yahoo.com', '696-870-7403', 'Female', 'South Rodney'),
(18, 'Jon Rogers', 'fgilbert@gmail.com', '335-441-7793', 'Female', 'Scottchester'),
(19, 'Sarah Armstrong', 'moralesmegan@hotmail.com', '372-214-0357', 'Male', 'Allisonfurt'),
(20, 'Edward Carr', 'edwardwilson@gmail.com', '028-412-9490', 'Male', 'Lake Stephenstad');

## Insert Drivers
INSERT INTO Drivers (DriverID, Name, Phone, Rating) VALUES
(101, 'Ronald Underwood', '314.036.1193', 3.9),
(102, 'Sherry Gray', '328.282.3114', 4.67),
(103, 'John Lewis', '086-321-3854', 3.85),
(104, 'Katie White', '465-561-8165', 4.5),
(105, 'Robert Munoz', '748.014.6186', 3.58),
(106, 'Joanna Lewis', '275.090.3497', 4.67),
(107, 'Brenda Burns', '986.497.3745', 4.74),
(108, 'Wendy Evans', '368.091.7327', 4.4),
(109, 'Matthew Rivers', '124.373.8108', 3.91),
(110, 'Kevin Nelson', '272.285.8585', 3.91),
(111, 'Nicole Miller', '917.768.3027', 3.86),
(112, 'Joshua Hill', '357.311.3532', 3.59),
(113, 'Courtney Mitchell', '960.253.8016', 4.21),
(114, 'Rebecca Thompson', '596.053.3501', 3.98),
(115, 'Stacey Dennis', '078.511.1369', 3.72),
(116, 'Ashley Kennedy', '746.928.9947', 4.29),
(117, 'Steven Smith', '312.403.7137', 4.4),
(118, 'Deborah Allen', '385.747.8363', 3.94),
(119, 'Brian Cooper', '211-794-6880', 4.15),
(120, 'Jenna Jones', '749.410.9291', 4.56);

select * from Drivers;
## Insert Cabs
INSERT INTO Cabs (CabID, DriverID, vehicleType, PlateNumber) VALUES
(201, 101, 'Sedan', 'MH12AB1234'),
(202, 102, 'SUV', 'MH14CD5678'),
(203, 103, 'Hatchback', 'MH01XY3456'),
(204, 104, 'Sedan', 'MH02PQ6789'),
(205, 105, 'SUV', 'MH03LM2468'),
(206, 106, 'Mini', 'MH05JK1122'),
(207, 107, 'Sedan', 'MH06GH3344'),
(208, 108, 'SUV', 'MH07EF5566'),
(209, 109, 'Hatchback', 'MH08CD7788'),
(210, 110, 'Sedan', 'MH09AB9900'),
(211, 111, 'Mini', 'MH10ZY1234'),
(212, 112, 'Sedan', 'MH11UV5678'),
(213, 113, 'SUV', 'MH12ST9012'),
(214, 114, 'Sedan', 'MH13QR3456'),
(215, 115, 'Mini', 'MH14OP7890'),
(216, 116, 'Sedan', 'MH15MN2345'),
(217, 117, 'SUV', 'MH16KL6789'),
(218, 118, 'Hatchback', 'MH17IJ1234'),
(219, 119, 'Sedan', 'MH18GH5678'),
(220, 120, 'SUV', 'MH19EF9012');

SELECT * FROM Cabs;


## Insert Booking 
INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingDate, Status, PickupLocation, DropoffLocation) VALUES
(201, 11, 201, '2024-10-01 15:00:00', 'Cancelled', 'North Gregory', 'Port William'),
(202, 8, 202, '2024-10-02 14:00:00', 'Cancelled', 'Christopherstad', 'Scottchester'),
(203, 17, 203, '2024-10-03 09:00:00', 'Completed', 'Davisfort', 'Port Catherine'),
(204, 12, 204, '2024-10-04 18:00:00', 'Cancelled', 'South Amanda', 'Fowlerstad'),
(205, 11, 205, '2024-10-05 18:00:00', 'Completed', 'Port Christopher', 'Scottchester'),
(206, 4, 206, '2024-10-06 19:00:00', 'Completed', 'Melissaview', 'Allisonfurt'),
(207, 10, 207, '2024-10-07 10:00:00', 'Completed', 'Lake Stephenstad', 'Fowlerstad'),
(208, 8, 208, '2024-10-08 14:00:00', 'Cancelled', 'Allisonfurt', 'Port Christopher'),
(209, 3, 209, '2024-10-09 20:00:00', 'Completed', 'North Gregory', 'Melissaview'),
(210, 2, 210, '2024-10-10 13:00:00', 'Completed', 'Lake Stephenstad', 'Lake Stephenstad'),
(211, 20, 211, '2024-10-11 13:00:00', 'Completed', 'New Robert', 'North Rhonda'),
(212, 1, 212, '2024-10-12 21:00:00', 'Completed', 'Scottchester', 'Allisonfurt'),
(213, 10, 213, '2024-10-13 07:00:00', 'Completed', 'Port Catherine', 'North Staceyland'),
(214, 6, 214, '2024-10-14 14:00:00', 'Cancelled', 'Davisfort', 'Melissaview'),
(215, 4, 215, '2024-10-15 10:00:00', 'Pending', 'South Rodney', 'Allisonfurt'),
(216, 8, 216, '2024-10-16 13:00:00', 'Completed', 'Port William', 'Christopherstad'),
(217, 11, 217, '2024-10-17 12:00:00', 'Completed', 'Christopherstad', 'North Gregory'),
(218, 3, 218, '2024-10-18 11:00:00', 'Pending', 'North Rhonda', 'North Staceyland'),
(219, 14, 219, '2024-10-19 12:00:00', 'Pending', 'Scottchester', 'Port William'),
(220, 5, 220, '2024-10-20 11:00:00', 'Completed', 'Fowlerstad', 'Scottchester');
select * from Bookings;


## Insert TripDetails
INSERT INTO TripDetails (TripID, BookingID, Distance_KM, Duration_Min, BaseFare, Taxes, TotalFare) VALUES
(301, 203, 5.82, 48, 285.66, 28.57, 314.23),
(302, 205, 20.14, 53, 126.45, 12.65, 139.1),
(303, 206, 18.12, 55, 297.98, 29.8, 327.78),
(304, 207, 15.06, 26, 151.91, 15.19, 167.1),
(305, 209, 14.89, 59, 221.72, 22.17, 243.89),
(306, 210, 14.2, 14, 176.36, 17.64, 194.0),
(307, 211, 7.87, 17, 149.18, 14.92, 164.1),
(308, 212, 7.73, 37, 289.94, 28.99, 318.93),
(309, 213, 5.74, 30, 148.14, 14.81, 162.95),
(310, 216, 16.99, 33, 169.33, 16.93, 186.26),
(311, 217, 17.88, 53, 192.65, 19.27, 211.92),
(312, 220, 20.37, 18, 168.77, 16.88, 185.65),
(313, 204, 19.86, 26, 235.45, 23.55, 259.0);

## Insert Payments
INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) VALUES
(401, 203, 314.23, 'Credit Card', '2024-10-01 16:00:00'),
(402, 205, 139.1, 'Wallet', '2024-10-02 18:00:00'),
(403, 206, 327.78, 'UPI', '2024-10-03 21:00:00'),
(404, 207, 167.1, 'Credit Card', '2024-10-04 09:00:00'),
(405, 209, 243.89, 'Cash', '2024-10-05 11:00:00'),
(406, 210, 194.0, 'Cash', '2024-10-06 17:00:00'),
(407, 211, 164.1, 'Wallet', '2024-10-07 15:00:00'),
(408, 212, 318.93, 'UPI', '2024-10-08 20:00:00'),
(409, 213, 162.95, 'Credit Card', '2024-10-09 07:00:00'),
(410, 216, 186.26, 'Cash', '2024-10-10 18:00:00'),
(411, 217, 211.92, 'Cash', '2024-10-11 08:00:00'),
(412, 220, 185.65, 'Wallet', '2024-10-12 17:00:00'),
(413, 204, 259.0, 'Wallet', '2024-10-13 15:00:00');


------------------------------------------------------------------------------
## 1. How many completed trips were made?
select count(*)  AS completed_trips
from Bookings
where status = "completed";

## 2. Which driver had the highest number of completed trips?
SELECT D.Name, COUNT(*) AS trip_count
FROM Bookings B
JOIN Cabs C ON B.CabID = C.CabID
JOIN Drivers D ON C.DriverID = D.DriverID
WHERE B.Status = 'Completed'
GROUP BY D.DriverID
ORDER BY trip_count DESC
LIMIT 1;

## 3. Which city has the most bookings?
SELECT C.City, COUNT(*) AS total_bookings
FROM Customers C
JOIN Bookings B ON C.CustomerID = B.CustomerID
GROUP BY C.City
ORDER BY total_bookings DESC
LIMIT 1;

## 4. Average trip duration and fare?
SELECT AVG(Duration_Min) AS avg_duration, AVG(TotalFare) AS avg_fare
FROM TripDetails;

## 5. Total revenue from completed bookings?
SELECT SUM(Amount) AS total_revenue
FROM Payments
WHERE BookingID IN (SELECT BookingID FROM Bookings WHERE Status = 'Completed');

## 6. Which drivers has the higeest rating
SELECT 
    DriverID, 
    Name, 
    Rating 
FROM 
    Drivers 
ORDER BY 
    Rating DESC 
LIMIT 1;

## 7. Top 3 Rated Drivers
SELECT 
    DriverID, 
    Name, 
    Rating 
FROM 
    Drivers 
ORDER BY 
    Rating DESC 
LIMIT 3;

## 8. highest trips by drivers
SELECT 
    d.DriverID,
    d.Name,
    COUNT(b.BookingID) AS TotalTrips
FROM 
    Drivers d
JOIN 
    Cabs c ON d.DriverID = c.DriverID
JOIN 
    Bookings b ON c.CabID = b.CabID
WHERE 
    b.Status = 'Completed'
GROUP BY 
    d.DriverID, d.Name
ORDER BY 
    TotalTrips DESC
LIMIT 1;


## 9. Driver with Most Cancelled Trips

SELECT 
    d.DriverID,
    d.Name,
    COUNT(b.BookingID) AS CancelledTrips
FROM 
    Drivers d
JOIN 
    Cabs c ON d.DriverID = c.DriverID
JOIN 
    Bookings b ON c.CabID = b.CabID
WHERE 
    b.Status = 'Cancelled'
GROUP BY 
    d.DriverID, d.Name
ORDER BY 
    CancelledTrips DESC
LIMIT 1;

## 10 Drivers with 0 Cancelled Trips
SELECT 
    d.DriverID,
    d.Name
FROM 
    Drivers d
JOIN 
    Cabs c ON d.DriverID = c.DriverID
JOIN 
    Bookings b ON c.CabID = b.CabID
GROUP BY 
    d.DriverID, d.Name
HAVING 
    SUM(CASE WHEN b.Status = 'Cancelled' THEN 1 ELSE 0 END) = 0;
    
    
## 11. Most Booked Date
SELECT 
    DATE(BookingDate) AS Booking_Day,
    COUNT(*) AS Total_Bookings
FROM 
    Bookings
GROUP BY 
    DATE(BookingDate)
ORDER BY 
    Total_Bookings DESC
LIMIT 1;

## 12.Most Booked Hour of the Day
SELECT 
    HOUR(BookingDate) AS Booking_Hour,
    COUNT(*) AS Total_Bookings
FROM 
    Bookings
GROUP BY 
    HOUR(BookingDate)
ORDER BY 
    Total_Bookings DESC
LIMIT 1;

## 13. Most Booked Day of the Week
SELECT 
    DAYNAME(BookingDate) AS Day_Name,
    COUNT(*) AS Total_Bookings
FROM 
    Bookings
GROUP BY 
    DAYNAME(BookingDate)
ORDER BY 
    Total_Bookings DESC;

## 14.Most Booked Month
SELECT 
    MONTHNAME(BookingDate) AS Month_Name,
    COUNT(*) AS Total_Bookings
FROM 
    Bookings
GROUP BY 
    MONTHNAME(BookingDate)
ORDER BY 
    Total_Bookings DESC;
    
## 15.Cancelled Bookings by Day
SELECT 
    DAYNAME(BookingDate) AS Day,
    COUNT(*) AS Cancelled_Trips
FROM 
    Bookings
WHERE 
    Status = 'Cancelled'
GROUP BY 
    DAYNAME(BookingDate)
ORDER BY 
    Cancelled_Trips DESC;
    
## 16.  Top 5 Drivers with Highest Average Ratings
SELECT 
    DriverID, 
    Name, 
    Rating
FROM 
    Drivers
ORDER BY 
    Rating DESC
LIMIT 5;

## 17.  Driver with Maximum Completed Trips
SELECT 
    d.DriverID,
    d.Name,
    COUNT(*) AS Completed_Trips
FROM 
    Bookings b
JOIN 
    Cabs c ON b.CabID = c.CabID
JOIN 
    Drivers d ON c.DriverID = d.DriverID
WHERE 
    b.Status = 'Completed'
GROUP BY 
    d.DriverID, d.Name
ORDER BY 
    Completed_Trips DESC
LIMIT 1;

## 18. Most Active Customers (by number of bookings)
select 
    c.CustomerID,
    cu.Name,
    COUNT(*) AS Total_Bookings
FROM 
    Bookings c
JOIN 
    Customers cu ON c.CustomerID = cu.CustomerID
GROUP BY 
    c.CustomerID, cu.Name
ORDER BY 
    Total_Bookings DESC
LIMIT 5;

## 19.  Most Popular Pickup Locations
SELECT 
    PickupLocation,
    COUNT(*) AS Pickup_Count
FROM 
    Bookings
GROUP BY 
    PickupLocation
ORDER BY 
    Pickup_Count DESC
LIMIT 5;

## 20. Busiest Days for Bookings
SELECT 
    DAYNAME(BookingDate) AS Day,
    COUNT(*) AS Bookings_Count
FROM 
    Bookings
GROUP BY 
    DAYNAME(BookingDate)
ORDER BY 
    Bookings_Count DESC;
