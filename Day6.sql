use northwind;

SELECT table_name
FROM information_schema.tables
WHERE table_type='BASE TABLE'
      AND table_schema = 'northwind';

-- What is the name of the table that holds the items Northwind sells? 
select ProductName from Products;

-- Write a query to list the product id, product name, and unit price of every product. 
SELECT ProductID, ProductName, UnitPrice FROM Products;

-- Write a query to list the product id, product name, and unit price of every product. Except this time, order them in ascending order by price. 
SELECT ProductID, ProductName, UnitPrice FROM Products ORDER BY UnitPrice;

-- What are the products that we carry where the unit price is $7.50 or less? 
SELECT ProductID, ProductName, UnitPrice FROM Products where UnitPrice <= 7.5;

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products WHERE UnitsInStock >= 100 ORDER BY UnitPrice desc;

-- What are the products that we carry where we have at least 100 units on hand?
-- Order them in descending order by price. If two or more have the same price, list
-- those in ascending order by product name.
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products WHERE UnitsInStock >= 100 ORDER BY UnitPrice desc, ProductName;

-- What are the products that we carry where we have no units on hand, but 1 or
-- more units of them on backorder? Order them by product name.
SELECT * FROM Products WHERE UnitsInStock = 0 and UnitsOnOrder >= 1 ORDER BY ProductName;

-- What is the name of the table that holds the types (categories) of the items
-- Northwind sells?
SELECT * from Categories;

-- Write a query that lists all of the columns and all of the rows of the categories
-- table? What is the category id of seafood?
SELECT * from Categories WHERE CategoryName = 'Seafood';

-- Examine the Products table. How does it identify the type (category) of each item
-- sold? Write a query to list all of the seafood items we carry.
SELECT  ProductID, ProductName, CategoryName FROM Products JOIN Categories ON Products.CategoryID =  Categories.CategoryID WHERE CategoryName = 'Seafood'; 

-- What are the first and last names of all of the Northwind employees? 
SELECT FirstName, LastName FROM Employees;

-- What employees have "manager" in their titles?
SELECT FirstName, LastName, Title FROM Employees WHERE Title LIKE '%Manager%';

-- List the distinct job titles in employees.
SELECT DISTINCT(Title) FROM Employees;

-- What employees have a salary that is between $200 0 and $2500?
SELECT * FROM Employees WHERE Salary BETWEEN 2000 AND 2500;

-- List all of the information about all of Northwind's suppliers
SELECT * FROM Suppliers;

-- Examine the Products table. How do you know what supplier supplies each
-- product? Write a query to list all of the items that "Tokyo Traders" supplies to
-- Northwind
SELECT ProductID, ProductName, CompanyName FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID WHERE CompanyName = 'Tokyo Traders';

-- Aggregate Functions

-- How many suppliers are there? Use a query!
SELECT COUNT(*) FROM Suppliers;

-- What is the sum of all the employee's salaries?
SELECT SUM(Salary) FROM Employees;

-- What is the price of the cheapest item that Northwind sells? 
SELECT MIN(UnitPrice) FROM Products;

-- What is the average price of items that Northwind sells? 
SELECT AVG(UnitPrice) FROM Products;

-- What is the price of the most expensive item that Northwind sells?
SELECT MAX(UnitPrice) FROM Products;

-- What is the supplier ID of each supplier and the number of items they supply?
-- You can answer this query by only looking at the Products table.
SELECT Products.SupplierID, CompanyName, Count(*) FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID GROUP BY Products.SupplierID;

-- What is the category ID of each category and the average price of each item in the
-- category? You can answer this query by only looking at the Products table.
SELECT Products.CategoryID, CategoryName, Count(*) FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID GROUP BY Products.CategoryID;

-- For suppliers that provide at least 5 items to Northwind, what is the supplier ID of
-- each supplier and the number of items they supply? You can answer this query
-- by only looking at the Products table.
SELECT Products.SupplierID, CompanyName, Count(*) AS COUNT FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID GROUP BY Products.SupplierID HAVING COUNT >= 5 ;

-- List the product id, product name, and inventory value (calculated by multiplying
-- unit price by the number of units on hand). Sort the results in descending order
-- by value. If two or more have the same value, order by product name.
SELECT ProductID, ProductName, (UnitPrice * UnitsInStock) AS InventoryValue FROM Products ORDER BY InventoryValue desc, ProductName;

-- What is the product name(s) of the most expensive products? HINT: Find the
-- max price in a subquery and then use that value to find products whose price
-- equals that value.
SELECT ProductName FROM Products WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- What is the order id, shipping name and shipping address of all orders shipped via
-- "Federal Shipping"? HINT: Find the shipper id of "Federal Shipping" in a subquery
-- and then use that value to find the orders that used that shipper.
SELECT OrderID, ShipName, ShipAddress FROM Orders WHERE ShipVia IN (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Federal Shipping');

-- What are the order ids of the orders that ordered "Sasquatch Ale"? HINT: Find
-- the product id of "Sasquatch Ale" in a subquery and then use that value to find
-- the matching orders from the `order details` table. Because the `order details`
-- table has a space in its name, you will need to surround it with back ticks in the
-- FROM clause.
SELECT OrderID, ProductID FROM `Order Details` WHERE ProductID = (SELECT ProductID FROM Products WHERE ProductName = 'Sasquatch Ale');

-- What is the name of the employee that sold order 10266?
SELECT FirstName, LastName FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Orders WHERE OrderID=10266);

-- What is the name of the customer that bought order 10266?
SELECT CompanyName FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE OrderID=10266);

-- JOINS

-- List the product id, product name, unit price and category name of all products.
-- Order by category name and within that, by product name.
SELECT ProductID, ProductName, UnitPrice, CategoryName FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID ORDER BY CategoryName, ProductName;

-- List the product id, product name, unit price and supplier name of all products
-- that cost more than $75. Order by product name.
SELECT ProductID, ProductName, UnitPrice, CompanyName FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID WHERE UnitPrice >= 75 ORDER BY ProductName;

-- List the product id, product name, unit price, category name, and supplier name
-- of every product. Order by product name.
SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName FROM Products, Suppliers, Categories WHERE Products.CategoryId = Categories.CategoryID AND Products.SupplierID = Suppliers.SupplierID ORDER BY ProductName;
SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID JOIN Categories ON Products.CategoryId = Categories.CategoryID ORDER BY ProductName;

-- What is the product name(s) and categories of the most expensive products?
-- HINT: Find the max price in a subquery and then use that in your more complex
-- query that joins products with categories.
SELECT ProductName, CategoryName FROM Products JOIN Categories WHERE Products.CategoryID = Categories.CategoryID AND UnitPrice IN (SELECT MAX(UnitPrice) FROM Products);

-- List the order id, ship name, ship address, and shipping company name of every
-- order that shipped to Germany.
SELECT OrderID, ShipName, ShipAddress, CompanyName FROM Orders JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID WHERE ShipCountry = 'Germany';

-- List the order id, order date, ship name, ship address of all orders that ordered
-- "Sasquatch Ale"?
SELECT Orders.OrderID, OrderDate, ShipName, ShipAddress FROM Products JOIN `Order Details` ON Products.ProductID = `Order Details`.ProductID JOIN Orders ON `Order Details`.OrderID = Orders.OrderID WHERE ProductName = 'Sasquatch Ale';

-- CRUD
-- Add a new supplier.
INSERT INTO Suppliers(CompanyName, ContactName, ContactTitle, Address, City,  PostalCode, Country, Phone, Fax) Values ('Krishna Ltd', 'Krishna', 'Marketing Manager','98 Krishaana st','Osaka','545','Japan','43312313','43312313');

-- Add a new product provided by that supplier
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) values ('Paneer',30,4,'100 g',120,150, 0,0,0);

-- List all products and their suppliers.
SELECT ProductName, CompanyName FROM Products JOIN Suppliers WHERE Products.SupplierID = Suppliers.SupplierID;

-- Raise the price of your new product by 15%
UPDATE Products SET UnitPrice = ((UnitPrice * 0.15)+UnitPrice) WHERE ProductName = 'Paneer' AND ProductID = 78;

-- List the products and prices of all products from that supplier.
SELECT ProductName, UnitPrice FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID WHERE Suppliers.SupplierID = 30;

-- Delete the new product.
DELETE FROM Products WHERE ProductName='Paneer' AND ProductID = 78;

-- Delete the new supplier.
DELETE FROM Suppliers WHERE SupplierID = 30;

-- List all products. 
SELECT * FROM Products;

-- List all suppliers.
SELECT * FROM Suppliers;