
-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 04
-- Date: 2026-08-09
use sepidar01

----------------------------------------------------
-- Q1. Write a query to display the number of invoices for each customer.
select CustomerRealName  ,count (*) as num 
from sls.Invoice 
group by CustomerRealName
-------------------------------------------------

------------------------------------------------------
--q3. Write a query to display the number of invoices, the latest invoice date, and the earliest invoice date for each customer.
select CustomerRealName  ,count (*) as num  ,max([date])  AS LatestInvoiceDate,   min([date]) as EarliestInvoiceDate
from sls.Invoice  
group by CustomerRealName
------------------------------------------------------
--Write a query to display the number of invoices for each customer, along with the latest and earliest invoice dates in the entire sls.Invoice table
select CustomerRealName  ,count (*) as num  , max(max([date])) over () AS LatestInvoiceDate,  min ( min([date])) over() as EarliestInvoiceDate
from sls.Invoice  
group by CustomerRealName 