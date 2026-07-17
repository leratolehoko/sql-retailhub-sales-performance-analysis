-- ==========================================================
-- RetailHub Sales & Performance Analysis
-- Author: Lerato Lehoko
-- Database: RetailHubDB
-- Description:
-- A SQL portfolio project analyzing retail sales performance
-- using MySQL. The project demonstrates database design,
-- joins, aggregate functions, subqueries, CASE statements,
-- and views to answer business questions.
-- ==========================================================


-- ==========================================================
-- 1. CREATE DATABASE
-- ==========================================================

CREATE DATABASE RetailHubDB;

USE RetailHubDB;

-- ==========================================================
-- 2. CREATE TABLES
-- ==========================================================

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Position VARCHAR(50),
    StoreID INT,
    FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    EmployeeID INT,
    StoreID INT,
    Quantity INT,
    OrderDate DATE,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),

    FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
);

-- ==========================================================
-- 3. INSERT DATA
-- ==========================================================

-- ----------------------------------------------------------
-- Stores
-- ----------------------------------------------------------

INSERT INTO Stores (StoreID, StoreName, City)
VALUES
(1, 'RetailHub Sandton', 'Johannesburg'),
(2, 'RetailHub Menlyn', 'Pretoria'),
(3, 'RetailHub Gateway', 'Durban'),
(4, 'RetailHub Canal Walk', 'Cape Town'),
(5, 'RetailHub Mimosa', 'Bloemfontein');

-- ----------------------------------------------------------
-- Employees
-- ----------------------------------------------------------

INSERT INTO Employees (EmployeeID, EmployeeName, Position, StoreID)
VALUES
(101, 'Ishmael Lehoko', 'Store Manager', 1),
(102, 'Thabo Mokoena', 'Sales Consultant', 1),
(103, 'Sarah Williams', 'Cashier', 2),
(104, 'Naledi Khumalo', 'Store Manager', 2),
(105, 'David Johnson', 'Sales Consultant', 3),
(106, 'Emma Brown', 'Cashier', 3),
(107, 'Michael Smith', 'Store Manager', 4),
(108, 'Olivia Taylor', 'Sales Consultant', 4),
(109, 'Kagiso Ndlovu', 'Cashier', 5),
(110, 'James Wilson', 'Store Manager', 5);

-- ----------------------------------------------------------
-- Customers
-- ----------------------------------------------------------

INSERT INTO Customers (CustomerID, CustomerName, Email, City)
VALUES
(201, 'Lerato Lehoko', 'lerato@gmail.com', 'Johannesburg'),
(202, 'Sarah Mokoena', 'sarah@gmail.com', 'Pretoria'),
(203, 'Thabo Dlamini', 'thabo@gmail.com', 'Johannesburg'),
(204, 'Naledi Molefe', 'naledi@gmail.com', 'Durban'),
(205, 'Michael Smith', 'michael@gmail.com', 'Cape Town'),
(206, 'Ayesha Patel', 'ayesha@gmail.com', 'Cape Town'),
(207, 'David Johnson', 'david@gmail.com', 'Durban'),
(208, 'Kagiso Ndlovu', 'kagiso@gmail.com', 'Bloemfontein'),
(209, 'Zanele Khumalo', 'zanele@gmail.com', 'Pretoria'),
(210, 'Brian Adams', 'brian@gmail.com', 'Johannesburg'),
(211, 'Grace Williams', 'grace@gmail.com', 'Cape Town'),
(212, 'Sipho Maseko', 'sipho@gmail.com', 'Durban'),
(213, 'Emma Brown', 'emma@gmail.com', 'Pretoria'),
(214, 'James Wilson', 'james@gmail.com', 'Bloemfontein'),
(215, 'Olivia Taylor', 'olivia@gmail.com', 'Johannesburg');

-- ----------------------------------------------------------
-- Products
-- ----------------------------------------------------------

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(301, 'Laptop', 'Electronics', 15000),
(302, 'Desktop Computer', 'Electronics', 18000),
(303, 'Monitor', 'Electronics', 3500),
(304, 'Keyboard', 'Accessories', 800),
(305, 'Mouse', 'Accessories', 450),
(306, 'Printer', 'Office', 4200),
(307, 'External Hard Drive', 'Storage', 1800),
(308, 'USB Flash Drive', 'Storage', 250),
(309, 'Office Chair', 'Furniture', 2800),
(310, 'Office Desk', 'Furniture', 4500),
(311, 'Webcam', 'Accessories', 950),
(312, 'Headphones', 'Accessories', 1200),
(313, 'Router', 'Networking', 1600),
(314, 'Projector', 'Office', 7200),
(315, 'Tablet', 'Electronics', 9500),
(316, 'Smartphone', 'Electronics', 12500),
(317, 'Power Bank', 'Accessories', 700),
(318, 'Microphone', 'Accessories', 2100),
(319, 'Graphics Tablet', 'Electronics', 5400),
(320, 'Laptop Stand', 'Accessories', 650);

-- ----------------------------------------------------------
-- Orders
-- ----------------------------------------------------------

INSERT INTO Orders (OrderID, CustomerID, ProductID, EmployeeID, StoreID, Quantity, OrderDate)
VALUES
(401, 201, 301, 101, 1, 2, '2026-01-10'),
(402, 202, 304, 103, 2, 5, '2026-01-11'),
(403, 203, 316, 102, 1, 1, '2026-01-12'),
(404, 204, 309, 105, 3, 3, '2026-01-13'),
(405, 205, 303, 107, 4, 2, '2026-01-14'),
(406, 206, 310, 108, 4, 1, '2026-01-15'),
(407, 207, 302, 106, 3, 1, '2026-01-16'),
(408, 208, 305, 109, 5, 6, '2026-01-17'),
(409, 209, 314, 104, 2, 1, '2026-01-18'),
(410, 210, 315, 101, 1, 2, '2026-01-19'),
(411, 211, 306, 107, 4, 2, '2026-01-20'),
(412, 212, 307, 105, 3, 4, '2026-01-21'),
(413, 213, 312, 103, 2, 3, '2026-01-22'),
(414, 214, 311, 110, 5, 2, '2026-01-23'),
(415, 215, 320, 102, 1, 5, '2026-01-24'),
(416, 201, 318, 101, 1, 1, '2026-01-25'),
(417, 202, 313, 104, 2, 2, '2026-01-26'),
(418, 203, 319, 102, 1, 1, '2026-01-27'),
(419, 204, 317, 106, 3, 4, '2026-01-28'),
(420, 205, 308, 108, 4, 8, '2026-01-29');

-- ==========================================================
-- 4. BUSINESS ANALYSIS QUERIES
-- ==========================================================

-- ----------------------------------------------------------
-- 1. Store with the Highest Revenue
-- ----------------------------------------------------------

SELECT
    StoreName,
    SUM(Quantity * Price) AS Revenue
FROM Stores s
INNER JOIN Orders o
    ON s.StoreID = o.StoreID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY StoreName
ORDER BY Revenue DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 2. Employee with the Highest Revenue
-- ----------------------------------------------------------

SELECT
    EmployeeName,
    SUM(Quantity * Price) AS Revenue
FROM Employees e
INNER JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY EmployeeName
ORDER BY Revenue DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 3. Highest Spending Customer
-- ----------------------------------------------------------

SELECT
    CustomerName,
    SUM(Quantity * Price) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY CustomerName
ORDER BY TotalSpent DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 4. Highest Revenue Product Category
-- ----------------------------------------------------------

SELECT
    Category,
    SUM(Quantity * Price) AS Revenue
FROM Products p
INNER JOIN Orders o
    ON p.ProductID = o.ProductID
GROUP BY Category
ORDER BY Revenue DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 5. Highest Revenue City
-- ----------------------------------------------------------

SELECT
    City,
    SUM(Quantity * Price) AS Revenue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY City
ORDER BY Revenue DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 6. Employee Who Processed the Most Orders
-- ----------------------------------------------------------

SELECT
    EmployeeName,
    COUNT(OrderID) AS NumberOfOrders
FROM Employees e
INNER JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
GROUP BY EmployeeName
ORDER BY NumberOfOrders DESC
LIMIT 1;

-- ----------------------------------------------------------
-- 7. Average Order Value by Store
-- ----------------------------------------------------------

SELECT
    StoreName,
    AVG(Quantity * Price) AS AverageOrderValue
FROM Stores s
INNER JOIN Orders o
    ON s.StoreID = o.StoreID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY StoreName
ORDER BY AverageOrderValue DESC;

-- ----------------------------------------------------------
-- 8. Products Priced Above the Average Price
-- ----------------------------------------------------------

SELECT
    ProductName,
    Category,
    Price
FROM Products
WHERE Price >
(
    SELECT AVG(Price)
    FROM Products
);

-- ----------------------------------------------------------
-- 9. Customers Spending Above the Average Customer Spending
-- ----------------------------------------------------------

SELECT
    CustomerName,
    SUM(Quantity * Price) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY CustomerID, CustomerName
HAVING SUM(Quantity * Price) >
(
    SELECT AVG(TotalSpent)
    FROM
    (
        SELECT
            CustomerID,
            SUM(Quantity * Price) AS TotalSpent
        FROM Orders o
        INNER JOIN Products p
            ON o.ProductID = p.ProductID
        GROUP BY CustomerID
    ) AS CustomerTotals
)
ORDER BY TotalSpent DESC;

-- ----------------------------------------------------------
-- 10. Product Price Classification
-- ----------------------------------------------------------

SELECT
    ProductName,
    Price,
    CASE
        WHEN Price >= 10000 THEN 'Expensive'
        WHEN Price BETWEEN 5000 AND 9999.99 THEN 'Moderate'
        ELSE 'Affordable'
    END AS PriceCategory
FROM Products;

-- ----------------------------------------------------------
-- 11. Store Performance Classification
-- ----------------------------------------------------------

SELECT
    StoreName,
    SUM(Quantity * Price) AS Revenue,
    CASE
        WHEN SUM(Quantity * Price) >= 40000 THEN 'High Performing'
        WHEN SUM(Quantity * Price) BETWEEN 20000 AND 39999.99 THEN 'Average Performing'
        ELSE 'Low Performing'
    END AS Performance
FROM Stores s
INNER JOIN Orders o
    ON s.StoreID = o.StoreID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY StoreName;

-- ----------------------------------------------------------
-- 12. Monthly Revenue
-- ----------------------------------------------------------

SELECT
    MONTH(OrderDate) AS Month,
    SUM(Quantity * Price) AS Revenue
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY MONTH(OrderDate)
ORDER BY Month;

-- ==========================================================
-- 5. VIEWS
-- ==========================================================

-- ----------------------------------------------------------
-- Store Revenue View
-- ----------------------------------------------------------

CREATE VIEW StoreRevenue AS
SELECT
    StoreName,
    SUM(Quantity * Price) AS Revenue
FROM Stores s
INNER JOIN Orders o
    ON s.StoreID = o.StoreID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY StoreName;

-- ----------------------------------------------------------
-- Employee Performance View
-- ----------------------------------------------------------

CREATE VIEW EmployeePerformance AS
SELECT
    EmployeeName,
    SUM(Quantity * Price) AS Revenue
FROM Employees e
INNER JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY EmployeeName;

-- ----------------------------------------------------------
-- Customer Spending View
-- ----------------------------------------------------------

CREATE VIEW CustomerSpending AS
SELECT
    CustomerName,
    SUM(Quantity * Price) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY CustomerName;

-- ----------------------------------------------------------
-- Example Usage of Views
-- ----------------------------------------------------------

SELECT *
FROM StoreRevenue
ORDER BY Revenue DESC;

SELECT *
FROM EmployeePerformance
ORDER BY Revenue DESC;

SELECT *
FROM CustomerSpending
ORDER BY TotalSpent DESC;


