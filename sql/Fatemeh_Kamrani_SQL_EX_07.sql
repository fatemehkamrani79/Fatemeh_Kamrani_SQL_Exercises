-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 07
-- Date: 2026-08-18


------------------------------------------------


select
	cast(i.[date] as date) as invoiceDate,
	i.Creator as SellerID,
	fmk.[User].name as SellerName ,
	iii.Title as ProdName,
	ii.ItemRef as ProdID,
	u.Title as UnitName,
	u.UnitID as UnitID,
	sls.SaleType.SaleTypeId as SalesTypeID,
	SLS.SaleType.Title as SalesTypeName,

	sum(
	CASE
	WHEN u.UnitID =1   then ii.Quantity * ed.IntegerColumn3
	when u.UnitID =2  then  ii.Quantity * 1000
	else null 
end
		) as totalnetweight ,
	SUM(ii.Quantity) as TotalQuantity,
	SUM(ii.NetPriceInBaseCurrency) as TotalNetSales
from sls.InvoiceItem as ii
join sls.Invoice as i
on ii.InvoiceRef =i.InvoiceId
join  fmk.[User]
on i.creator =fmk.[User].userid
join inv.item as iii
on iii.ItemID = ii.ItemRef
join inv.unit as u
on iii.UnitRef = u.UnitID
left join fmk.ExtraData as ed  
on iii.ItemID = ed.EntityRef
and 
ed.EntityTypeName = 'SG.Inventory.ItemManagement.Common.DsItem'
join sls.SaleType 
on sls.SaleType.SaleTypeId= i.SaleTypeRef

group by 
	cast(i.[date] as date),
	i.Creator,
	fmk.[User].Name,
	iii.Title,
	ii.ItemRef,
	u.Title,
	u.UnitID,
	sls.SaleType.SaleTypeId,
	SLS.SaleType.Title;