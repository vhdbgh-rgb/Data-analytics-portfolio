-- AdventureWorks2019
-- JOIN Analysis
-- SQL Server

-- 15. Product with its subcategory
SELECT
    p.ProductID,
    p.Name AS ProductName,
    ps.Name AS SubcategoryName
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID;


-- 16. All products including products
-- without a matching subcategory
SELECT
    p.ProductID,
    p.Name AS ProductName,
    ps.Name AS SubcategoryName
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID;


-- 17. Products with ListPrice above 1000
-- and a matching subcategory
SELECT
    p.ProductID,
    p.Name AS ProductName,
    ps.Name AS SubcategoryName,
    p.ListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.ListPrice > 1000
  AND ps.ProductSubcategoryID IS NOT NULL;


-- 18. Product, subcategory and category
SELECT
    p.ProductID,
    p.Name AS ProductName,
    ps.Name AS SubcategoryName,
    p.ListPrice,
    pc.Name AS CategoryName
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID;


-- 19. Products without a subcategory
SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.ListPrice
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.ProductSubcategoryID IS NULL;


-- 20. Product count by subcategory
SELECT
    ps.Name AS SubcategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
ORDER BY ProductCount DESC;


-- 21. Product count, average price and
-- total ListPrice by category
SELECT
    pc.Name AS CategoryName,
    COUNT(p.ProductID) AS ProductCount,
    AVG(p.ListPrice) AS AveragePrice,
    SUM(p.ListPrice) AS TotalListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalListPrice DESC;
