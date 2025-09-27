-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Gender CHAR(1),
    BirthDate DATE,
    Phone VARCHAR(15),
    City VARCHAR(50)
);

-- Branch Table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    ManagerID INT NULL
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Gender CHAR(1),
    BranchID INT,
    ManagerID INT NULL,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

-- Product Table
CREATE TABLE Product (
    ProductCode INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Color VARCHAR(30),
    Size VARCHAR(20),
    UnitPrice DECIMAL(10,2),
    CurrentStock INT
);

-- Payment Method Table
CREATE TABLE PaymentMethod (
    PaymentMethodID INT PRIMARY KEY,
    MethodName VARCHAR(50)
);

-- Sale Table
CREATE TABLE Sale (
    InvoiceID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    CustomerID INT,
    BranchID INT,
    PaymentMethodID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID)
);

-- Sale Details 
CREATE TABLE SaleDetails (
    InvoiceID INT,
    ProductCode INT,
    Quantity INT,
    PRIMARY KEY (InvoiceID, ProductCode),
    FOREIGN KEY (InvoiceID) REFERENCES Sale(InvoiceID),
    FOREIGN KEY (ProductCode) REFERENCES Product(ProductCode)
);

-- Customers
INSERT INTO Customer VALUES
(1, 'Ahmed Ali', 'M', '1990-05-10', '01011111111', 'Cairo'),
(2, 'Sara Mohamed', 'F', '1985-09-20', '01022222222', 'Alexandria'),
(3, 'John Smith', 'M', '1992-12-01', '01033333333', 'Giza'),
(4, 'Laila Hassan', 'F', '1995-06-15', '01044444444', 'Cairo'),
(5, 'Omar Khaled', 'M', '1988-03-08', '01055555555', 'Mansoura');

-- Branches
INSERT INTO Branch VALUES
(1, 'Cairo Branch', '123 Tahrir St', 'Cairo', NULL),
(2, 'Alex Branch', '45 Corniche Rd', 'Alexandria', NULL),
(3, 'Giza Branch', '78 Pyramids Ave', 'Giza', NULL),
(4, 'Mansoura Branch', '12 Nile St', 'Mansoura', NULL),
(5, 'Tanta Branch', '34 Central Rd', 'Tanta', NULL);

-- Employees
INSERT INTO Employee VALUES
(1, 'Ali Hassan', 'Manager', 'M', 1, NULL),
(2, 'Mona Said', 'Cashier', 'F', 1, 1),
(3, 'Karim Youssef', 'Sales Rep', 'M', 2, NULL),
(4, 'Nour Samir', 'Manager', 'F', 3, NULL),
(5, 'Hany Adel', 'Sales Rep', 'M', 3, 4);

-- Products
INSERT INTO Product VALUES
(100, 'Laptop Dell', 'Electronics', 'Black', '15-inch', 15000, 20),
(101, 'iPhone 14', 'Mobile', 'Silver', '128GB', 25000, 15),
(102, 'Samsung TV', 'Electronics', 'Black', '55-inch', 18000, 10),
(103, 'Adidas Shoes', 'Fashion', 'White', '42', 2000, 50),
(104, 'Nike T-shirt', 'Fashion', 'Blue', 'L', 500, 100);

-- Payment Methods
INSERT INTO PaymentMethod VALUES
(1, 'Cash'),
(2, 'Credit Card'),
(3, 'Debit Card'),
(4, 'Digital Wallet'),
(5, 'Bank Transfer');

-- Sales 
INSERT INTO Sale VALUES
(1, '2023-09-01', '10:30', 1, 1, 1),
(2, '2023-09-02', '14:15', 2, 2, 2),
(3, '2023-09-03', '16:00', 3, 1, 3),
(4, '2023-09-04', '18:45', 4, 3, 1),
(5, '2023-09-05', '11:20', 5, 4, 4);

-- Sale Details (UnitPrice = transaction price, not product price)
INSERT INTO SaleDetails VALUES
(1, 100, 1),
(1, 103, 2),
(2, 101, 1),
(3, 104, 3),
(4, 102, 1);

