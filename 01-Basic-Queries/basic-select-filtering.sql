-- AdventureWorks2019
-- Basic Product Queries
-- SQL Server

-- 01. Products with a ListPrice greater than 1000
SELECT
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice > 1000;


-- 02. Products with a ListPrice greater than 500
-- and names matching the specified pattern
SELECT
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice > 500
  AND Name LIKE '_a';


-- 03. Products priced between 500 and 1500
SELECT
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice BETWEEN 500 AND 1500
ORDER BY ListPrice DESC;


-- 04. Top 10 most expensive products
SELECT TOP 10
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice > 0
ORDER BY ListPrice DESC;


-- 05. Products with specific prices
SELECT
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice IN (100, 500, 1000)
  AND ListPrice > 0;


-- 06. Products whose names end with "bike"
SELECT
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice > 0
  AND Name LIKE '%bike';
