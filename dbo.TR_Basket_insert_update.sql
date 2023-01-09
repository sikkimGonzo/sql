create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as
update dbo.Basket
  set DiscountValue = Value * 0.5
  where ID = (select ID from Inserted) and Quantity >= 2
go
