CREATE DATABASE TRAVEL_MANAGEMENT_SYSTEM;
USE TRAVEL_MANAGEMENT_SYSTEM;
							



/*****************************************CUSTOMERS***************************************************/
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Insert 30 records into the Customers table
INSERT INTO Customers (CustomerID, Name, Age, Email, Phone) VALUES
(1, 'John Doe', 30, 'john.doe@example.com', '1234567890'),
(2, 'Jane Smith', 25, 'jane.smith@example.com', '0987654321'),
(3, 'Robert Brown', 40, 'robert.brown@example.com', '1122334455'),
(4, 'Emily Johnson', 35, 'emily.johnson@example.com', '2233445566'),
(5, 'Michael White', 28, 'michael.white@example.com', '3344556677'),
(6, 'Sarah Green', 32, 'sarah.green@example.com', '4455667788'),
(7, 'David Black', 45, 'david.black@example.com', '5566778899'),
(8, 'Laura Wilson', 22, 'laura.wilson@example.com', '6677889900'),
(9, 'Daniel Lee', 33, 'daniel.lee@example.com', '7788990011'),
(10, 'Sophia Young', 29, 'sophia.young@example.com', '8899001122'),
(11, 'James King', 36, 'james.king@example.com', '9900112233'),
(12, 'Linda Clark', 41, 'linda.clark@example.com', '1011121314'),
(13, 'Brian Hall', 27, 'brian.hall@example.com', '1213141516'),
(14, 'Mary Lewis', 38, 'mary.lewis@example.com', '1314151617'),
(15, 'Kevin Harris', 34, 'kevin.harris@example.com', '1415161718'),
(16, 'Olivia Martin', 26, 'olivia.martin@example.com', '1516171819'),
(17, 'Nathan Walker', 31, 'nathan.walker@example.com', '1617181920'),
(18, 'Emma Young', 23, 'emma.young@example.com', '1718192021'),
(19, 'Lucas Scott', 37, 'lucas.scott@example.com', '1819202122'),
(20, 'Grace Adams', 24, 'grace.adams@example.com', '1920212223'),
(21, 'Isaac Baker', 39, 'isaac.baker@example.com', '2021222324'),
(22, 'Sophia King', 30, 'sophia.king@example.com', '2122232425'),
(23, 'Liam Hill', 21, 'liam.hill@example.com', '2223242526'),
(24, 'Ava Wright', 42, 'ava.wright@example.com', '2324252627'),
(25, 'Benjamin Green', 28, 'benjamin.green@example.com', '2425262728'),
(26, 'Mia Young', 34, 'mia.young@example.com', '2526272829'),
(27, 'Alexander Lewis', 32, 'alexander.lewis@example.com', '2627282930'),
(28, 'Charlotte Scott', 29, 'charlotte.scott@example.com', '2728293031'),
(29, 'Ethan White', 35, 'ethan.white@example.com', '2829303132'),
(30, 'Aiden Johnson', 27, 'aiden.johnson@example.com', '2930313233');

SELECT*FROM Customers;

/************************************BOOKINGS TABLES******************************************************/
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    BookingDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

       -- Insert 30 records into the Bookings table
INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TotalAmount) VALUES
(1, 1, '2024-01-15', 200.00),
(2, 2, '2024-01-16', 250.50),
(3, 3, '2024-01-17', 180.75),
(4, 4, '2024-01-18', 300.00),
(5, 5, '2024-01-19', 150.20),
(6, 6, '2024-01-20', 220.00),
(7, 7, '2024-01-21', 275.00),
(8, 8, '2024-01-22', 190.40),
(9, 9, '2024-01-23', 230.00),
(10, 10, '2024-01-24', 260.70),
(11, 11, '2024-01-25', 175.50),
(12, 12, '2024-01-26', 280.00),
(13, 13, '2024-01-27', 210.30),
(14, 14, '2024-01-28', 195.60),
(15, 15, '2024-01-29', 240.00),
(16, 16, '2024-01-30', 225.80),
(17, 17, '2024-01-31', 260.00),
(18, 18, '2024-02-01', 175.90),
(19, 19, '2024-02-02', 290.00),
(20, 20, '2024-02-03', 200.00),
(21, 21, '2024-02-04', 270.40),
(22, 22, '2024-02-05', 220.00),
(23, 23, '2024-02-06', 240.50),
(24, 24, '2024-02-07', 230.00),
(25, 25, '2024-02-08', 250.00),
(26, 26, '2024-02-09', 180.00),
(27, 27, '2024-02-10', 275.00),
(28, 28, '2024-02-11', 260.00),
(29, 29, '2024-02-12', 210.00),
(30, 30, '2024-02-13', 290.00);

SELECT*FROM Bookings

/************************************FLIGHT TABLES**********************************************************/


CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    FlightNumber VARCHAR(10),
    DepartureCity VARCHAR(50),
    ArrivalCity VARCHAR(50),
    DepartureDate DATE,
    ArrivalDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


ALTER TABLE Flights
DROP FOREIGN KEY flights_ibfk_1;

ALTER TABLE Flights
ADD CONSTRAINT flights_ibfk_1 FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID);

-- Insert 30 records into the Flights table
INSERT INTO Flights (BookingID, FlightNumber, DepartureCity, ArrivalCity, DepartureDate, ArrivalDate) VALUES
(1, 'AA123', 'New York', 'Los Angeles', '2024-01-15', '2024-01-15'),
(2, 'BA456', 'London', 'Paris', '2024-01-16', '2024-01-16'),
(3, 'CA789', 'Beijing', 'Shanghai', '2024-01-17', '2024-01-17'),
(4, 'DA321', 'Tokyo', 'Osaka', '2024-01-18', '2024-01-18'),
(5, 'EA654', 'Sydney', 'Melbourne', '2024-01-19', '2024-01-19'),
(6, 'FA987', 'Dubai', 'Abu Dhabi', '2024-01-20', '2024-01-20'),
(7, 'GA543', 'Berlin', 'Munich', '2024-01-21', '2024-01-21'),
(8, 'HA210', 'Rome', 'Milan', '2024-01-22', '2024-01-22'),
(9, 'IA876', 'Madrid', 'Barcelona', '2024-01-23', '2024-01-23'),
(10, 'JA123', 'Toronto', 'Vancouver', '2024-01-24', '2024-01-24'),
(11, 'KA456', 'Moscow', 'Saint Petersburg', '2024-01-25', '2024-01-25'),
(12, 'LA789', 'Delhi', 'Mumbai', '2024-01-26', '2024-01-26'),
(13, 'MA321', 'Bangkok', 'Phuket', '2024-01-27', '2024-01-27'),
(14, 'NA654', 'Seoul', 'Busan', '2024-01-28', '2024-01-28'),
(15, 'OA987', 'Istanbul', 'Ankara', '2024-01-29', '2024-01-29'),
(16, 'PA543', 'Cairo', 'Alexandria', '2024-01-30', '2024-01-30'),
(17, 'QA210', 'Johannesburg', 'Cape Town', '2024-01-31', '2024-01-31'),
(18, 'RA876', 'Buenos Aires', 'Cordoba', '2024-02-01', '2024-02-01'),
(19, 'SA123', 'Santiago', 'Valparaiso', '2024-02-02', '2024-02-02'),
(20, 'TA456', 'Lima', 'Cusco', '2024-02-03', '2024-02-03'),
(21, 'UA789', 'Caracas', 'Maracaibo', '2024-02-04', '2024-02-04'),
(22, 'VA321', 'Mexico City', 'Cancun', '2024-02-05', '2024-02-05'),
(23, 'WA654', 'Rio de Janeiro', 'Sao Paulo', '2024-02-06', '2024-02-06'),
(24, 'XA987', 'Bogota', 'Medellin', '2024-02-07', '2024-02-07'),
(25, 'YA543', 'Havana', 'Santiago de Cuba', '2024-02-08', '2024-02-08'),
(26, 'ZA210', 'Athens', 'Thessaloniki', '2024-02-09', '2024-02-09'),
(27, 'AB123', 'Lisbon', 'Porto', '2024-02-10', '2024-02-10'),
(28, 'BB456', 'Warsaw', 'Krakow', '2024-02-11', '2024-02-11'),
(29, 'CB789', 'Prague', 'Brno', '2024-02-12', '2024-02-12'),
(30, 'DB321', 'Vienna', 'Salzburg', '2024-02-13', '2024-02-13');



SELECT*FROM FLIGHTS;





/************************************HOTELS TABLES**********************************************************/
CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    BookingID INT,
    HotelName VARCHAR(100),
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Insert 30 records into the Hotels table
INSERT INTO Hotels (HotelID, BookingID, HotelName, CheckInDate, CheckOutDate) VALUES
(1, 1, 'Grand Hotel', '2024-02-01', '2024-02-05'),
(2, 2, 'Ocean View', '2024-02-02', '2024-02-06'),
(3, 3, 'Mountain Retreat', '2024-02-03', '2024-02-07'),
(4, 4, 'City Central', '2024-02-04', '2024-02-08'),
(5, 5, 'Lakeside Inn', '2024-02-05', '2024-02-09'),
(6, 6, 'Beachfront Paradise', '2024-02-06', '2024-02-10'),
(7, 7, 'Hilltop Haven', '2024-02-07', '2024-02-11'),
(8, 8, 'Downtown Deluxe', '2024-02-08', '2024-02-12'),
(9, 9, 'Sunset Suites', '2024-02-09', '2024-02-13'),
(10, 10, 'Forest Lodge', '2024-02-10', '2024-02-14'),
(11, 11, 'Riverside Resort', '2024-02-11', '2024-02-15'),
(12, 12, 'Urban Oasis', '2024-02-12', '2024-02-16'),
(13, 13, 'Harbor Hotel', '2024-02-13', '2024-02-17'),
(14, 14, 'Garden Getaway', '2024-02-14', '2024-02-18'),
(15, 15, 'Desert Dunes', '2024-02-15', '2024-02-19'),
(16, 16, 'Valley Vista', '2024-02-16', '2024-02-20'),
(17, 17, 'Seaside Sanctuary', '2024-02-17', '2024-02-21'),
(18, 18, 'Mountain View', '2024-02-18', '2024-02-22'),
(19, 19, 'Royal Palace', '2024-02-19', '2024-02-23'),
(20, 20, 'Luxury Lodge', '2024-02-20', '2024-02-24'),
(21, 21, 'Budget Inn', '2024-02-21', '2024-02-25'),
(22, 22, 'Airport Hotel', '2024-02-22', '2024-02-26'),
(23, 23, 'Countryside Cottage', '2024-02-23', '2024-02-27'),
(24, 24, 'Metropolitan Hotel', '2024-02-24', '2024-02-28'),
(25, 25, 'Highland House', '2024-02-25', '2024-02-29'),
(26, 26, 'Eco Lodge', '2024-02-26', '2024-03-01'),
(27, 27, 'Urban Retreat', '2024-02-27', '2024-03-02'),
(28, 28, 'Seaview Suites', '2024-02-28', '2024-03-03'),
(29, 29, 'Boutique Hotel', '2024-02-29', '2024-03-04'),
(30, 30, 'Central Park Inn', '2024-03-01', '2024-03-05');

       SELECT*FROM Hotels;
       
/************************************PAYMENTS TABLES************************************************************/
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT NOT NULL,
    CustomerID INT,
    BookingID INT NOT NULL,
    HotelID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);


-- Insert 30 records into the Payments table
INSERT INTO Payments (CustomerID, BookingID, HotelID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, 1, '2024-01-15', 200.00, 'Credit Card'),
(2, 2, 2, '2024-01-16', 250.50, 'Debit Card'),
(3, 3, 3, '2024-01-17', 180.75, 'Cash'),
(4, 4, 4, '2024-01-18', 300.00, 'Credit Card'),
(5, 5, 5, '2024-01-19', 150.20, 'Debit Card'),
(6, 6, 6, '2024-01-20', 220.00, 'Cash'),
(7, 7, 7, '2024-01-21', 275.00, 'Credit Card'),
(8, 8, 8, '2024-01-22', 190.40, 'Debit Card'),
(9, 9, 9, '2024-01-23', 230.00, 'Cash'),
(10, 10, 10, '2024-01-24', 260.70, 'Credit Card'),
(11, 11, 11, '2024-01-25', 175.50, 'Debit Card'),
(12, 12, 12, '2024-01-26', 280.00, 'Cash'),
(13, 13, 13, '2024-01-27', 210.30, 'Credit Card'),
(14, 14, 14, '2024-01-28', 195.60, 'Debit Card'),
(15, 15, 15, '2024-01-29', 240.00, 'Cash'),
(16, 16, 16, '2024-01-30', 225.80, 'Credit Card'),
(17, 17, 17, '2024-01-31', 260.00, 'Debit Card'),
(18, 18, 18, '2024-02-01', 175.90, 'Cash'),
(19, 19, 19, '2024-02-02', 290.00, 'Credit Card'),
(20, 20, 20, '2024-02-03', 200.00, 'Debit Card'),
(21, 21, 21, '2024-02-04', 270.40, 'Cash'),
(22, 22, 22, '2024-02-05', 220.00, 'Credit Card'),
(23, 23, 23, '2024-02-06', 240.50, 'Debit Card'),
(24, 24, 24, '2024-02-07', 230.00, 'Cash'),
(25, 25, 25, '2024-02-08', 250.00, 'Credit Card'),
(26, 26, 26, '2024-02-09', 180.00, 'Debit Card'),
(27, 27, 27, '2024-02-10', 275.00, 'Cash'),
(28, 28, 28, '2024-02-11', 260.00, 'Credit Card'),
(29, 29, 29, '2024-02-12', 210.00, 'Debit Card'),
(30, 30, 30, '2024-02-13', 290.00, 'Cash');


SELECT*from Payments;
/----------------------------------------------------FEEDBACK-----------------------------------------------------------------/

CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookingID INT,
    FeedbackDate DATE,
    Rating INT,
    Comments TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


-- Insert 30 records into the Feedback table
INSERT INTO Feedback (CustomerID, BookingID, FeedbackDate, Rating, Comments) VALUES
(1, 1, '2024-01-16', 5, 'Excellent service and smooth booking process.'),
(2, 2, '2024-01-17', 4, 'Very good experience overall.'),
(3, 3, '2024-01-18', 3, 'Average service, room for improvement.'),
(4, 4, '2024-01-19', 5, 'Loved the hotel and flight arrangements.'),
(5, 5, '2024-01-20', 4, 'Good experience, would book again.'),
(6, 6, '2024-01-21', 3, 'Decent service but had some issues.'),
(7, 7, '2024-01-22', 5, 'Exceptional service, highly recommend.'),
(8, 8, '2024-01-23', 2, 'Not satisfied with the hotel stay.'),
(9, 9, '2024-01-24', 4, 'Good service, minor delays.'),
(10, 10, '2024-01-25', 3, 'Average experience.'),
(11, 11, '2024-01-26', 5, 'Fantastic trip, everything was perfect.'),
(12, 12, '2024-01-27', 4, 'Very good, a few minor issues.'),
(13, 13, '2024-01-28', 3, 'Okay experience, could be better.'),
(14, 14, '2024-01-29', 5, 'Amazing service, will book again.'),
(15, 15, '2024-01-30', 4, 'Good, had a pleasant trip.'),
(16, 16, '2024-01-31', 2, 'Had several issues, not very satisfied.'),
(17, 17, '2024-02-01', 5, 'Excellent booking process.'),
(18, 18, '2024-02-02', 3, 'Service was okay.'),
(19, 19, '2024-02-03', 4, 'Good experience overall.'),
(20, 20, '2024-02-04', 5, 'Everything went smoothly, great service.'),
(21, 21, '2024-02-05', 4, 'Very good, minor issues.'),
(22, 22, '2024-02-06', 3, 'Average, could improve.'),
(23, 23, '2024-02-07', 2, 'Not very happy with the service.'),
(24, 24, '2024-02-08', 5, 'Perfect trip, excellent service.'),
(25, 25, '2024-02-09', 4, 'Good, but some delays.'),
(26, 26, '2024-02-10', 3, 'Mediocre experience.'),
(27, 27, '2024-02-11', 5, 'Loved the trip, will book again.'),
(28, 28, '2024-02-12', 4, 'Very good, enjoyed the trip.'),
(29, 29, '2024-02-13', 3, 'Average service.'),
(30, 30, '2024-02-14', 5, 'Fantastic, everything was great.');

SELECT*FROM Feedback

/*********************************************************************************************************************/

Scenario: Retrieve Customer,Booking,Flights,Hotel,Payments,Feedback Information

                 SELECT*FROM Customers;
                 SELECT*FROM Bookings;
                 SELECT*FROM Flights;
                 SELECT*FROM Hotels;
                 SELECT*FROM Payments;
                 SELECT*FROM Feedback; 
/-------------------------------------------UPDATE------------------------------------------------------------------------/
Scenario: Customer Reschedules Trip
Update Booking Date in Bookings Table
Update Flight Dates in Flights Table
Update Hotel Stay Dates in Hotels Table
Update Payment Amount in Payments Table                

UPDATE Bookings
SET BookingDate = '2024-03-05', TotalAmount = 400.00
WHERE BookingID = 1;

UPDATE Flights
SET DepartureDate = '2024-03-05', ArrivalDate = '2024-03-05'
WHERE BookingID = 1;

UPDATE Hotels
SET CheckInDate = '2024-03-05', CheckOutDate = '2024-03-10'
WHERE BookingID = 1;

UPDATE Payments
SET Amount = 400.00, PaymentDate = '2024-03-05'
WHERE BookingID = 1;

----------------------------------------------------------------------------------------------------------------------
                                               DELETE
							
Delete a specific record from the Customers table:

DELETE FROM Customers
WHERE CustomerID = 1;


Delete a specific record from the Flights table:

DELETE FROM Flights
WHERE FlightID = 1;

Deleting Entire Tables
To delete an entire table, use the DROP TABLE command:

Delete the Customers table:
DROP TABLE Customers;

Delete the Feedback table:
DROP TABLE Feedback;

--------------------------------------------------------------------------------------------------------------------
                                                 ALTER TABLE
                                                 
Add a new column to the Customers table:

ALTER TABLE Customers
ADD Address VARCHAR(255);


Change the Data Type of the Phone Column:

ALTER TABLE Customers
MODIFY COLUMN Phone VARCHAR(15);
.......................................................................................................................
                                                 COUNT,AVERAGE,SUM
						
Count the number of customers:

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

Count the number of bookings:

SELECT COUNT(*) AS TotalBookings
FROM Bookings;

Calculate the average age of customers:

SELECT AVG(Age) AS AverageAge
FROM Customers;

Calculate the average total amount spent on bookings:

SELECT AVG(TotalAmount) AS AverageBookingAmount
FROM Bookings;

Calculate the total amount spent by all customers:

SELECT SUM(TotalAmount) AS TotalSpent
FROM Bookings;  

Calculate the average duration of hotel stays:

SELECT AVG(DATEDIFF(CheckOutDate, CheckInDate)) AS AverageStayDuration
FROM Hotels;

Calculate the total payment amount:

SELECT SUM(Amount) AS TotalPaymentAmount
FROM Payments;
.....................................................................................................................
                                               WHERE

Count the number of bookings in February 2024:

SELECT COUNT(*) AS TotalBookings
FROM Bookings
WHERE BookingDate BETWEEN '2024-02-01' AND '2024-02-29';

Count the number of hotel stays in 'Beachfront Paradise':

SELECT COUNT(*) AS TotalHotelStays
FROM Hotels
WHERE HotelName = 'Beachfront Paradise';

Count the number of payments made using 'Credit Card':

SELECT COUNT(*) AS TotalPayments
FROM Payments
WHERE PaymentMethod = 'Credit Card';

Calculate the total sum of ratings given by CustomerID 15:

SELECT SUM(Rating) AS TotalRatings
FROM Feedback
WHERE CustomerID = 15;

SELECT SUM(Amount) AS TotalPaymentsForCustomer1
FROM Payments
WHERE CustomerID = 1;

......................................................................................................................
                                           ORDER BY
                                           
Retrieve all customers sorted by their names in ascending order:

SELECT * FROM Customers
ORDER BY  Name ASC;

Retrieve all bookings sorted by the total amount in ascending order:

SELECT * FROM Bookings
ORDER BY TotalAmount ASC;

Retrieve all flights sorted by departure date in descending order:

SELECT * FROM Flights
ORDER BY DepartureDate DESC;

Retrieve all feedback entries sorted by rating in descending order and feedback date in ascending order:

SELECT * FROM Feedback
ORDER BY Rating DESC, FeedbackDate ASC;
......................................................................................................................
                                            MIN AND MAX
Find the minimum age of customers:
SELECT MIN(Age) AS MinimumAge
FROM Customers;

Find the earliest booking date:
SELECT MIN(BookingDate) AS EarliestBookingDate
FROM Bookings;

Find the minimum payment amount:
SELECT MIN(Amount) AS MinimumPaymentAmount

Find the maximum age of customers:
SELECT MAX(Age) AS MaximumAge

Find the maximum payment amount:
SELECT MAX(Amount) AS MaximumPaymentAmount
FROM Payments;

Find the maximum total amount for bookings made in January 2024:
SELECT MAX(TotalAmount) AS MaximumBookingAmount
FROM Bookings
WHERE BookingDate BETWEEN '2024-01-01' AND '2024-01-31';

......................................................................................................................
												AND OR NOT
											
Retrieve bookings in January 2024 with a total amount greater than 200:

SELECT * FROM Bookings
WHERE BookingDate BETWEEN '2024-01-01' AND '2024-01-31' AND TotalAmount > 200;

Retrieve bookings made in either January or February 2024:

SELECT * FROM Bookings
WHERE BookingDate BETWEEN '2024-01-01' AND '2024-01-31' OR BookingDate BETWEEN '2024-02-01' AND '2024-02-29';

 Retrieve Payments Not Made with a Credit Card
SELECT * FROM Payments
WHERE PaymentMethod != 'Credit Card';

Find bookings made in either January or February 2024, with a total amount greater than 200, but exclude those made by CustomerID 5

SELECT * FROM Bookings
WHERE (BookingDate BETWEEN '2024-01-01' AND '2024-01-31' 
OR BookingDate BETWEEN '2024-02-01' AND '2024-02-29')
AND TotalAmount > 200
AND NOT CustomerID = 5;
.....................................................................................................................
                                          LIKE,WILDCARDS,BETWEEN
                                          
Retrieve Customers with Names Starting with 'J':
SELECT * FROM Customers
WHERE Name LIKE 'J%';

Retrieve Customers with Names that Have 'a' as the Second Character:
SELECT * FROM Customers
WHERE Name LIKE '_a%';

Retrieve Customers Aged Between 25 and 35:

SELECT * FROM Customers
WHERE Age BETWEEN 25 AND 35;
......................................................................................................................
                                                HAVING,GROUP BY
                                                
Find Customers with Total Payment Amount Greater Than 500:
SELECT CustomerID, SUM(Amount) AS TotalPaymentAmount
FROM Payments
GROUP BY CustomerID
HAVING SUM(Amount) > 200;

Find Hotels with an Average Stay Duration Greater Than 3 Days:
SELECT HotelName, AVG(DATEDIFF(CheckOutDate, CheckInDate)) AS AverageStayDuration
FROM Hotels
GROUP BY HotelName
HAVING AVG(DATEDIFF(CheckOutDate, CheckInDate)) > 3;
......................................................................................................................
                                                            JOINS
                                      INNER JOIN,RIGHT JOIN ,LEFT JOIN,CROSS JOIN, SELF JOIN
							
Retrieve customer details along with their booking information:

SELECT Customers.CustomerID, Customers.Name, Customers.Age, Customers.Email, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount
FROM Customers
INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;

Retrieve complete trip details including customer, booking, flight, hotel, and payment information:

SELECT Customers.CustomerID, Customers.Name, Customers.Email, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount, 
       Flights.FlightNumber, Flights.DepartureCity, Flights.ArrivalCity, 
       Hotels.HotelName, Hotels.CheckInDate, Hotels.CheckOutDate, 
       Payments.PaymentDate, Payments.Amount, Payments.PaymentMethod
FROM Customers
INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
INNER JOIN Flights ON Bookings.BookingID = Flights.BookingID
INNER JOIN Hotels ON Bookings.BookingID = Hotels.BookingID
INNER JOIN Payments ON Bookings.BookingID = Payments.BookingID;

Retrieve all flights along with booking details, showing all flights even if there is no matching booking:

SELECT Flights.FlightID, Flights.FlightNumber, Flights.DepartureCity, Flights.ArrivalCity, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount
FROM Flights
RIGHT JOIN Bookings ON Flights.BookingID = Bookings.BookingID;

Retrieve all hotels along with booking details, showing all hotels even if there is no matching booking:

SELECT Hotels.HotelID, Hotels.HotelName, Hotels.CheckInDate, Hotels.CheckOutDate, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount
FROM Hotels
RIGHT JOIN Bookings ON Hotels.BookingID = Bookings.BookingID;

Retrieve customer details along with their booking information, showing all customers even if they dont have a booking:

SELECT Customers.CustomerID, Customers.Name, Customers.Email, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount
FROM Customers
LEFT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;

Retrieve booking details along with their associated hotel stay information, showing all bookings even if they dont have an associated hotel stay:

SELECT Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount, 
       Hotels.HotelName, Hotels.CheckInDate, Hotels.CheckOutDate
FROM Bookings
LEFT JOIN Hotels ON Bookings.BookingID = Hotels.BookingID;

Cross Join Bookings and Flights
Retrieve all possible combinations of bookings and flights

SELECT Bookings.BookingID, Bookings.BookingDate, 
       Flights.FlightID, Flights.FlightNumber
FROM Bookings
CROSS JOIN Flights;

Lets find pairs of customers who have the same age:

SELECT A.CustomerID AS CustomerID1, A.Name AS Name1, 
       B.CustomerID AS CustomerID2, B.Name AS Name2, 
       A.Age
FROM Customers A
INNER JOIN Customers B ON A.Age = B.Age AND A.CustomerID < B.CustomerID;


......................................................................................................................
                                               UNION,UNION ALL
                                               
Combine the names of customers and the names of hotels into a single list:

SELECT Name AS EntityName
FROM Customers
UNION
SELECT HotelName AS EntityName
FROM Hotels;

Combine the flight numbers and booking IDs, including duplicates:

SELECT FlightNumber AS Identifier
FROM Flights
UNION ALL
SELECT CAST(BookingID AS CHAR) AS Identifier
FROM Bookings;
......................................................................................................................
												SUBQUERY ANY,IN,ALL

Retrieve customers whose booking amounts are greater than any booking amount made by CustomerID 10:

SELECT CustomerID, Name, Email
FROM Customers
WHERE CustomerID != 10 
AND CustomerID IN (SELECT CustomerID 
                   FROM Bookings 
                   WHERE TotalAmount > ANY (SELECT TotalAmount 
                                             FROM Bookings 
                                             WHERE CustomerID = 10));


Retrieve customers who have made bookings in February 2024:

SELECT CustomerID, Name, Email
FROM Customers
WHERE CustomerID IN (SELECT CustomerID 
                     FROM Bookings 
                     WHERE BookingDate BETWEEN '2024-02-01' AND '2024-02-29');

Retrieve customers whose booking amounts are greater than all booking amounts made by CustomerID 5:

SELECT CustomerID, Name, Email
FROM Customers
WHERE CustomerID != 5 
AND CustomerID IN (SELECT CustomerID 
                   FROM Bookings 
                   WHERE TotalAmount > ALL (SELECT TotalAmount 
                                             FROM Bookings 
                                             WHERE CustomerID = 5));
......................................................................................................................
                                         IF NULL
                                         
Retrieve customer names and emails, replacing NULL emails with 'No Email Provided':

SELECT Name, IFNULL(Email, 'No Email Provided') AS Email
FROM Customers;

Retrieve hotel stay information, replacing NULL hotel names with 'Unknown Hotel':

SELECT HotelID, BookingID, IFNULL(HotelName, 'Unknown Hotel') AS HotelName, 
       CheckInDate, CheckOutDate
FROM Hotels;
......................................................................................................................
											  CREATE VIEW TABLE

Customer Booking View
Create a view that shows customer details along with their booking information.

CREATE VIEW CustomerBookingView AS
SELECT Customers.CustomerID, Customers.Name, Customers.Email, 
       Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount
FROM Customers
INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;

2. Booking Flight View
Create a view that shows booking details along with associated flight information.

CREATE VIEW BookingFlightView AS
SELECT Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount, 
       Flights.FlightNumber, Flights.DepartureCity, Flights.ArrivalCity, 
       Flights.DepartureDate, Flights.ArrivalDate
FROM Bookings
INNER JOIN Flights ON Bookings.BookingID = Flights.BookingID;

3. Booking Hotel View
Create a view that shows booking details along with associated hotel stay information.

CREATE VIEW BookingHotelView AS
SELECT Bookings.BookingID, Bookings.BookingDate, Bookings.TotalAmount, 
       Hotels.HotelName, Hotels.CheckInDate, Hotels.CheckOutDate
FROM Bookings
INNER JOIN Hotels ON Bookings.BookingID = Hotels.BookingID;

4. Payment Summary View
Create a view that shows customer payments, including their names and payment details.


CREATE VIEW PaymentSummaryView AS
SELECT Customers.CustomerID, Customers.Name, 
       Payments.PaymentID, Payments.PaymentDate, Payments.Amount, Payments.PaymentMethod
FROM Customers
INNER JOIN Payments ON Customers.CustomerID = Payments.CustomerID;

5. Customer Feedback View
Create a view that shows customer feedback along with their details.


CREATE VIEW CustomerFeedbackView AS
SELECT Customers.CustomerID, Customers.Name, Customers.Email, 
       Feedback.FeedbackDate, Feedback.Rating, Feedback.Comments
FROM Customers
INNER JOIN Feedback ON Customers.CustomerID = Feedback.CustomerID;
......................................................................................................................
											   --CASE
                                               
Let's' categorize customers as 'Young', 'Adult', or 'Senior' based on their age.

SELECT CustomerID, Name, Age,
       CASE 
           WHEN Age < 18 THEN 'Young'
           WHEN Age BETWEEN 18 AND 64 THEN 'Adult'
           ELSE 'Senior'
       END AS AgeCategory
FROM Customers;

Let's' label hotels based on the duration of stay.

SELECT HotelID, BookingID, HotelName, CheckInDate, CheckOutDate,
       CASE 
           WHEN DATEDIFF(CheckOutDate, CheckInDate) <= 3 THEN 'Short Stay'
           WHEN DATEDIFF(CheckOutDate, CheckInDate) BETWEEN 4 AND 7 THEN 'Moderate Stay'
           ELSE 'Long Stay'
       END AS StayDurationLabel
FROM Hotels;


Let's' evaluate feedback ratings as 'Positive', 'Neutral', or 'Negative':

SELECT FeedbackID, CustomerID, Rating, Comments,
       CASE 
           WHEN Rating >= 4 THEN 'Positive'
           WHEN Rating = 3 THEN 'Neutral'
           ELSE 'Negative'
       END AS FeedbackEvaluation
FROM Feedback;

.................................................................................................................
                                    STORE PROCEDURe
                                    
1. Create Stored Procedure for Customer Details
DELIMITER $$

CREATE PROCEDURE GetCustomerDetails (IN customerID INT)
BEGIN
    SELECT CustomerID, Name, Email, Age, City
    FROM Customers
    WHERE CustomerID = customerID;
END $$

DELIMITER ;
2. Create Stored Procedure for Bookings in a Date Range

DELIMITER $$

CREATE PROCEDURE GetBookingsInRange (IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT BookingID, CustomerID, BookingDate, TotalAmount
    FROM Bookings
    WHERE BookingDate BETWEEN startDate AND endDate;
END $$

call GetBookingsInRange 

                                    