create view dbo.vw_SKUPrice
as
select s.*, dbo.udf_GetSKUPrices.ID) as fun from SKU as s
go
