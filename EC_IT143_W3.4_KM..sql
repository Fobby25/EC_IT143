/*
Name: [Kayega Musa]
Course: EC IT143
Assignment: W3.4 AdventureWorks—Create Answers
Database: AdventureWorks2022

Description:
This script answers eight AdventureWorks questions created by
students in the W3.3 discussion board.

Estimated runtime: Less than one minute.
*/

USE AdventureWorks2022;
GO


/*
Question 1
Original author: Chidimma Nomeh
Question: What are the ten products with the highest list prices?
*/

SELECT TOP 10
    Name,
    ProductNumber,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


/*
Question 2
Original author: Chidimma Nomeh
Question: Which five products have the lowest standard costs?
*/

SELECT TOP 5
    Name,
    ProductNumber,
    StandardCost
FROM Production.Product
ORDER BY StandardCost ASC;


/*
Question 3
Original author: Chidimma Nomeh
Question: Which five products have the highest profit margin based on their
list price and standard cost, and what category does each product belong to?
*/

SELECT TOP 5
    p.Name AS ProductName,
    pc.Name AS CategoryName,
    p.ListPrice,
    p.StandardCost,
    p.ListPrice - p.StandardCost AS ProfitMargin
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
ORDER BY ProfitMargin DESC;


/*
Question 4
Original author: Chidimma Nomeh
Question: Which three customers have placed the most orders,
and which cities are they located in?
*/

WITH TopCustomers AS
(
    SELECT TOP 3
        c.CustomerID,
        p.BusinessEntityID,
        p.FirstName,
        p.LastName,
        COUNT(soh.SalesOrderID) AS NumberOfOrders
    FROM Sales.Customer AS c
    INNER JOIN Sales.SalesOrderHeader AS soh
        ON c.CustomerID = soh.CustomerID
    INNER JOIN Person.Person AS p
        ON c.PersonID = p.BusinessEntityID
    GROUP BY
        c.CustomerID,
        p.BusinessEntityID,
        p.FirstName,
        p.LastName
    ORDER BY NumberOfOrders DESC
)
SELECT
    tc.FirstName,
    tc.LastName,
    tc.NumberOfOrders,
    a.City
FROM TopCustomers AS tc
INNER JOIN Person.BusinessEntityAddress AS bea
    ON tc.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.Address AS a
    ON bea.AddressID = a.AddressID
ORDER BY
    tc.NumberOfOrders DESC,
    a.City;


/*
Question 5
Original author: Benjamin Aboagye Yeboah
Question: Which sales representatives have generated the highest sales revenue,
and how much revenue has each representative generated?
*/

SELECT
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS TotalSalesRevenue
FROM Sales.SalesPerson AS sp
INNER JOIN Person.Person AS p
    ON sp.BusinessEntityID = p.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader AS soh
    ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY
    p.FirstName,
    p.LastName
ORDER BY TotalSalesRevenue DESC;


/*
Question 6
Original author: Benjamin Aboagye Yeboah
Question: Which five customers have spent the most money on sales orders?
Show each customer's name and their total purchase amount.
*/

SELECT TOP 5
    CASE
        WHEN c.PersonID IS NOT NULL
            THEN CONCAT(p.FirstName, ' ', p.LastName)
        ELSE s.Name
    END AS CustomerName,
    SUM(soh.TotalDue) AS TotalPurchaseAmount
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
LEFT JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID
GROUP BY
    c.CustomerID,
    c.PersonID,
    p.FirstName,
    p.LastName,
    s.Name
ORDER BY TotalPurchaseAmount DESC;


/*
Question 7
Original author: Chidimma Nomeh
Question: Which tables in the AdventureWorks database contain a column named
ModifiedDate according to the INFORMATION_SCHEMA.COLUMNS view?
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ModifiedDate'
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;


/*
Question 8
Original author: Chidimma Nomeh
Question: Using INFORMATION_SCHEMA.TABLES, which tables are classified as
BASE TABLE and belong to the Production schema?
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Production'
    AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
