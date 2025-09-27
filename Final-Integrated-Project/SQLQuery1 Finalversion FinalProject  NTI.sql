-- CREATE DATABASE Final;

-- Create the Client table
CREATE TABLE Client (
    client_id INT PRIMARY KEY,
    client_fullName VARCHAR(255) NOT NULL,
    nationality VARCHAR(100),
    passport_no VARCHAR(50) UNIQUE,
    email VARCHAR(255) UNIQUE
);

-- Create the Branch table
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- Create the Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_fullName VARCHAR(255) NOT NULL,
    position VARCHAR(100),
    hire_date DATE,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Create the Airline table
CREATE TABLE Airline (
    airline_code VARCHAR(10) PRIMARY KEY,
    airline_name VARCHAR(255) NOT NULL
);

-- Create the Hotel table
CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(255) NOT NULL,
    rating INT,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- Create the PaymentMethod table
CREATE TABLE PaymentMethod (
    payment_id INT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    payment_date DATE
);

-- Create the Booking table
CREATE TABLE Booking (
    reference_no VARCHAR(50) PRIMARY KEY,
    booking_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    emp_id INT NOT NULL,
    client_id INT NOT NULL,
    branch_id INT NOT NULL,
    airline_code VARCHAR(10) NOT NULL,
    hotel_id INT NOT NULL,
    payment_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (airline_code) REFERENCES Airline(airline_code),
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id),
    FOREIGN KEY (payment_id) REFERENCES PaymentMethod(payment_id)
);




-----------------------
-- Client data
-----------------------
INSERT INTO Client (client_id, client_fullName, nationality, passport_no, email)
SELECT
    n AS client_id,
    T.client_fullName,
    T.nationality,
    'PAS' + RIGHT('000000' + CAST(n AS VARCHAR(10)), 6) AS passport_no,
    'client' + CAST(n AS VARCHAR(10)) + '@example.com' AS email
FROM (
    SELECT TOP 50 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects AS o1, sys.objects AS o2
) AS Nums
CROSS APPLY (
    SELECT
        CASE
            WHEN n % 10 = 1 THEN 'Ahmed Hassan'
            WHEN n % 10 = 2 THEN 'Sara Mohamed'
            WHEN n % 10 = 3 THEN 'Omar Khaled'
            WHEN n % 10 = 4 THEN 'Fatma Ali'
            WHEN n % 10 = 5 THEN 'Youssef Ibrahim'
            WHEN n % 10 = 6 THEN 'John Smith'
            WHEN n % 10 = 7 THEN 'Emily White'
            WHEN n % 10 = 8 THEN 'Michael Davis'
            WHEN n % 10 = 9 THEN 'Jessica Lee'
            ELSE 'David Chen'
        END AS client_fullName,
        CASE
            WHEN n % 5 = 1 THEN 'Egyptian'
            WHEN n % 5 = 2 THEN 'American'
            WHEN n % 5 = 3 THEN 'British'
            WHEN n % 5 = 4 THEN 'French'
            ELSE 'Japanese'
        END AS nationality
) AS T;

------------------
-- Branch data
------------------
INSERT INTO Branch (branch_id, branch_name, city, country)
VALUES
    (1, 'Cairo Main Branch', 'Cairo', 'Egypt'),
    (2, 'Dubai Downtown Branch', 'Dubai', 'UAE'),
    (3, 'London Oxford Street', 'London', 'UK'),
    (4, 'New York Midtown', 'New York', 'USA'),
    (5, 'Tokyo Ginza Branch', 'Tokyo', 'Japan'),
    (6, 'Paris Champs-Élysées', 'Paris', 'France');


--------------------
-- Employee data
--------------------
INSERT INTO Employee (emp_id, emp_fullName, position, hire_date, branch_id)
SELECT
    n AS emp_id,
    T.emp_fullName,
    P.position,
    DATEADD(day, -CAST(ABS(CHECKSUM(NEWID())) % 3650 AS INT), GETDATE()) AS hire_date,
    (n % 6) + 1 AS branch_id
FROM (
    SELECT TOP 50 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects AS o1, sys.objects AS o2
) AS Nums
CROSS APPLY (
    SELECT
        CASE
            WHEN n % 10 = 1 THEN 'Mohamed Ali'
            WHEN n % 10 = 2 THEN 'Sarah El-Sherif'
            WHEN n % 10 = 3 THEN 'Youssef Adel'
            WHEN n % 10 = 4 THEN 'Nour Fathy'
            WHEN n % 10 = 5 THEN 'Tamer Said'
            WHEN n % 10 = 6 THEN 'Fatma Omar'
            WHEN n % 10 = 7 THEN 'Hassan Mahmoud'
            WHEN n % 10 = 8 THEN 'Nada Tarek'
            WHEN n % 10 = 9 THEN 'Ali Gamal'
            ELSE 'Dina Salah'
        END AS emp_fullName
) AS T
CROSS APPLY (
    SELECT
        CASE
            WHEN n % 5 = 1 THEN 'Senior Agent'
            WHEN n % 5 = 2 THEN 'Travel Agent'
            WHEN n % 5 = 3 THEN 'Booking Specialist'
            WHEN n % 5 = 4 THEN 'Customer Support'
            ELSE 'Junior Agent'
        END AS position
) AS P;


--------------------
-- Airline data
--------------------
INSERT INTO Airline (airline_code, airline_name)
VALUES
    ('EGY', 'EgyptAir'),
    ('UAE', 'Emirates'),
    ('QTR', 'Qatar Airways'),
    ('TUR', 'Turkish Airlines'),
    ('LHA', 'Lufthansa'),
    ('BAW', 'British Airways'),
    ('AFR', 'Air France'),
    ('JAL', 'Japan Airlines'),
    ('AMX', 'Aeromexico');


----------------------
-- Hotel data
----------------------
INSERT INTO Hotel (hotel_id, hotel_name, rating, city, country)
VALUES
    (1, 'The Nile View Hotel', 5, 'Cairo', 'Egypt'),
    (2, 'Downtown Dubai Suites', 4, 'Dubai', 'UAE'),
    (3, 'London Grand Hotel', 5, 'London', 'UK'),
    (4, 'The Empire State Inn', 3, 'New York', 'USA'),
    (5, 'Ginza Palace Hotel', 4, 'Tokyo', 'Japan'),
    (6, 'Hotel de la Tour Eiffel', 5, 'Paris', 'France'),
    (7, 'The Sphinx Resort', 4, 'Cairo', 'Egypt'),
    (8, 'Palm Jumeirah Resort', 5, 'Dubai', 'UAE'),
    (9, 'Piccadilly Garden Hotel', 3, 'London', 'UK'),
    (10, 'Tokyo Bay View Hotel', 4, 'Tokyo', 'Japan');


-------------------------
-- Payment method
-------------------------
INSERT INTO PaymentMethod (payment_id, method_name, payment_date)
VALUES
    (1, 'Credit Card', GETDATE()),
    (2, 'PayPal', GETDATE()),
    (3, 'Bank Transfer', GETDATE()),
    (4, 'Apple Pay', GETDATE()),
    (5, 'Google Pay', GETDATE());


----------------------------
-- Booking data
----------------------------
-- Create CTEs to randomly select foreign key values
WITH RndClients AS (
    SELECT client_id, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM Client
),
RndEmployees AS (
    SELECT emp_id, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM Employee
),
RndBranches AS (
    SELECT branch_id, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM Branch
),
RndAirlines AS (
    SELECT airline_code, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM Airline
),
RndHotels AS (
    SELECT hotel_id, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM Hotel
),
RndPayments AS (
    SELECT payment_id, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn FROM PaymentMethod
)
-- Insert 50 booking records
INSERT INTO Booking (
    reference_no,
    booking_date,
    total_cost,
    emp_id,
    client_id,
    branch_id,
    airline_code,
    hotel_id,
    payment_id
)
SELECT
    'REF-' + CAST(NEWID() AS VARCHAR(50)), -- Ensure unique reference_no
    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 365, GETDATE()), -- Random date within last year
    CAST(ABS(CHECKSUM(NEWID())) % 10000 + 500 AS DECIMAL(10, 2)), -- Random cost
    RE.emp_id,
    RC.client_id,
    RB.branch_id,
    RA.airline_code,
    RH.hotel_id,
    RP.payment_id
FROM (
    SELECT TOP 50 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.objects AS o1, sys.objects AS o2
) AS Nums
JOIN RndClients RC ON RC.rn = Nums.n % (SELECT COUNT(*) FROM Client) + 1
JOIN RndEmployees RE ON RE.rn = Nums.n % (SELECT COUNT(*) FROM Employee) + 1
JOIN RndBranches RB ON RB.rn = Nums.n % (SELECT COUNT(*) FROM Branch) + 1
JOIN RndAirlines RA ON RA.rn = Nums.n % (SELECT COUNT(*) FROM Airline) + 1
JOIN RndHotels RH ON RH.rn = Nums.n % (SELECT COUNT(*) FROM Hotel) + 1
JOIN RndPayments RP ON RP.rn = Nums.n % (SELECT COUNT(*) FROM PaymentMethod) + 1;
