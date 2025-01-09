
SELECT * FROM Products

SELECT ProductCode, Price FROM Products

SELECT ProductCode, Price FROM Products 
WHERE ProductCode = 'C470'

SELECT ProductCode, Price FROM Products 
WHERE Price > 1

SELECT ProductCode, Price FROM Products WHERE Price != 1.0

SELECT ProductCode, Price FROM Products WHERE Price <> 1.0

--SELECT ProductCode, Price FROM Products WHERE Price NOT EQUAL 1.0

Select ProductCode, Price FROM Products WHERE Price > 1.0 OR Price < 0.9

SELECT * FROM ProductInventory

SELECT * FROM ProductInventory WHERE ProductCode = 'C470' 
AND Quantity > 100

SELECT * FROM ProductInventory WHERE 
ProductCode = 'C470' OR Quantity > 100

SELECT * FROM ProductInventory WHERE Manufacturer IS NULL

SELECT ProductCode, Price FROM Products WHERE ProductCode LIKE 'G%'

SELECT ProductCode, Price FROM Products WHERE ProductCode LIKE '%3%'

SELECT ProductCode, Price FROM Products WHERE ProductCode LIKE '_20'

SELECT ProductCode AS 'Product Code', Price FROM Products

SELECT ProductCode, Price FROM Products ORDER BY Price

SELECT ProductCode, Price FROM Products ORDER BY Price, ProductCode

SELECT * FROM Products LIMIT 5

SELECT DISTINCT Price FROM Products

SELECT DISTINCT ProductCode, Price FROM Products WHERE Price = 1 ORDER BY Price LIMIT 2
