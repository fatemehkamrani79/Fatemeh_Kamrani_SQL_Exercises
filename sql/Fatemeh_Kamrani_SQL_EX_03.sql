
-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 03
-- Date: 2026-08-08
use NORTHWND
Go 

 -- Question 1: Identify the relationships among the Customers, Orders, Order Details, Products, Suppliers, and Employees tables in the Northwind database.

/*
Relationship Number: 1 - Customers and Orders

Parent Table: Customers
Primary Key (PK): CustomerID

Child Table: Orders
Foreign Key (FK): CustomerID

Relationship:
Customers.CustomerID = Orders.CustomerID

Relationship Type: One-to-Many

Explanation:
One customer can have many orders.
Each order belongs to one customer.
*/

/*
Relationship Number: 2 - Orders and Order Details

Parent Table: Orders
Primary Key (PK): OrderID

Child Table: [Order Details]
Foreign Key (FK): OrderID

Relationship:
Orders.OrderID = [Order Details].OrderID

Relationship Type: One-to-Many

Explanation:
One order can have many order details.
Each order detail belongs to one order.
*/

/*
Relationship Number: 3 - Products and Order Details

Parent Table: Products
Primary Key (PK): ProductID

Child Table: [Order Details]
Foreign Key (FK): ProductID

Relationship:
Products.ProductID = [Order Details].ProductID

Relationship Type: One-to-Many

Explanation:
One product can appear in many order details.
Each order detail refers to one product.
*/

/*
Relationship Number: 4 - Suppliers and Products

Parent Table: Suppliers
Primary Key (PK): SupplierID

Child Table: Products
Foreign Key (FK): SupplierID

Relationship:
Suppliers.SupplierID = Products.SupplierID

Relationship Type: One-to-Many

Explanation:
One supplier can supply many products.
Each product belongs to one supplier.
*/

/*
Relationship Number: 5 - Employees and Orders

Parent Table: Employees
Primary Key (PK): EmployeeID

Child Table: Orders
Foreign Key (FK): EmployeeID

Relationship:
Employees.EmployeeID = Orders.EmployeeID

Relationship Type: One-to-Many

Explanation:
One employee can handle many orders.
Each order is handled by one employee.
*/



----------------------------------------------------------
-- Question 2: Retrieve a list of all customers who have placed an order, along with their order numbers. (Expected result: 830 rows)

select c.ContactName ,o.OrderID 
from  Customers as c
inner join Orders as o
on o.CustomerID = c.CustomerID

----------------------------------------------------------
-- Question 3: Retrieve a list of all customers, including those who have not placed any orders, along with their order numbers. (Expected result: 832 rows)
select c.ContactName ,o.OrderID 
from  Customers as c
left join Orders as o
on o.CustomerID = c.CustomerID
------------------------------------------------------
-- Question 4: Find the customers who have not placed any orders. (Expected result: 2 rows)
select c.ContactName 
from  Customers as c
left join Orders as o
on o.CustomerID = c.CustomerID
where o.OrderID is null

---------------------------------------------------
-- Question5: Retrieve a list of all products along with their categories. (Expected result: 77 rows)
select p.ProductName ,CategoryName
from Products as p 
inner join Categories 
on Categories.CategoryID = p.CategoryID
----------------------------------------
-- Question 6: Retrieve a list of all products along with their supplier company names and categories. (Expected result: 77 rows)
select p.ProductName, companyname ,CategoryName
from Products as p 
inner join Suppliers as sup
on  p.SupplierID =SUP.SupplierID
inner join Categories 
on Categories.CategoryID = p.CategoryID

--------------------------------------
-- Question 7: Find all products that have not been assigned to a category. (Expected result: 0 rows)
select p.ProductName ,CategoryName
from Products as p 
LEFT  join Categories as c
on C.CategoryID = p.CategoryID
WHERE c.CategoryID is null

--------------------------------------
-- Question 8: Retrieve a list of all order numbers along with the IDs and names of their related products. (Expected result: 2,155 rows)
select o.OrderID ,p.ProductID ,p.ProductName
from Orders as o
inner join [Order Details]  
on o.OrderID = [Order Details].OrderID
inner join Products as p
on p.ProductID = [Order Details].ProductID

