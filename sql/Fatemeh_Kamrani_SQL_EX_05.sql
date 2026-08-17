-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 05
-- Date: 2026-08-10

----------------------------------------------
/* Exercise 1
Display the ItemID, Title, and IsActive status of all products whose titles start with ìÕ·Ê«î.*/
select i.ItemID ,i.Title , i.IsActive
from inv.Item as i 
where title like N'Õ·Ê«%'

/*Exercise 2
Using a JOIN, retrieve the invoice-item number and the related invoice number for the orders of all products whose names start with ìHalva.î */ 
select i.InvoiceRef ,i.InvoiceItemID
from sls.InvoiceItem as i 
join inv.Item as ii 
on i.ItemRef = ii.ItemID
where  ii.Title like N'Õ·Ê«%'

/*Exercise 3
Obtain the same results as the previous exercise using a Subquery..*/
select i.InvoiceRef ,i.InvoiceItemID
from sls.InvoiceItem as i 
where exists (select 1 
from inv.Item as ii 
where  ii.Title like N'Õ·Ê«%' 
and i.ItemRef =
ii.ItemID )

/*Obtain a list of products that have never been ordered, using two methods: JOIN and SUBQUERY.
Expected output: 358 rows*/ 
select i.ItemID ,i.title ,ii.ItemRef
from  inv.item as i 
left join sls.InvoiceItem  as ii 
on ii.ItemRef = i.ItemID 
WHERE ii.ItemRef IS  NULL


select i.ItemID ,i.title 
from  inv.item as i 
where NOT EXISTS  (
select 1
from sls.InvoiceItem as ii
WHERE ii.ItemRef = i.ItemID 

)


