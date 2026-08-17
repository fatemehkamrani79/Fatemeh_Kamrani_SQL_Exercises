-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 02
-- Date: 2026-08-06

use sepidar01
Go
-------------------------------------------------------------------------------------------------------------------
-- Display each SaleTypeRef, the number of its invoices, and its percentage of the total invoices, sorted from highest to lowest percentage.
select SaleTypeRef,COUNT(*) as  InvoiceCount ,count(*) *100.0 / sum(count(*)) OVER () as [Percentage]
from sls.Invoice
group by SaleTypeRef
ORDER BY [Percentage] DESC;