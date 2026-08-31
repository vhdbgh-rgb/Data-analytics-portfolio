-- AdventureWorks2019
-- Aggregation Analysis
-- SQL Server

-- 07. Count products by subcategory
SELECT
    ProductSubcategoryID,
    COUNT(ProductID) AS ProductCount
FROM Production.Product
GROUP BY ProductSubcategoryID
ORDER BY ProductSubcategoryID;


-- 08. Average product price by subcategory
SELECT
    ProductSubcategoryID,
    AVG(ListPrice) AS AverageListPrice
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING AVG(ListPrice) > 20
ORDER BY AverageListPrice DESC;


-- 09. Top 5 products priced above 1000
-- with names starting with "B"
SELECT TOP 5
    Name AS ProductName,
    ProductID,
    ListPrice
FROM Production.Product
WHERE ListPrice > 1000
  AND Name LIKE 'B%'
ORDER BY ListPrice DESC;


-- 10. Count products by category
SELECT
    pc.Name AS CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;


-- 11. Categories with more than 50 products
SELECT
    pc.Name AS CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
HAVING COUNT(p.ProductID) > 50;


-- 12. Total ListPrice by category
SELECT
    pc.Name AS CategoryName,
    SUM(p.ListPrice) AS TotalListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;


-- 13. Average ListPrice by category
SELECT
    pc.Name AS CategoryName,
    AVG(p.ListPrice) AS AverageListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY AverageListPrice DESC;


-- 14. Average price by subcategory
-- for products priced above 500
-- showing only averages above 1000
SELECT
    ps.Name AS SubcategoryName,
    AVG(p.ListPrice) AS AveragePrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.ListPrice > 500
GROUP BY ps.Name
HAVING AVG(p.ListPrice) > 1000;
