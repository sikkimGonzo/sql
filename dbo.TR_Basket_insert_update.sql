create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as
update dbo.Basket
  set DiscountValue = (
    case
      when ((select count(i.ID_SKU)
             from Inserted as i
             where dbo.Basket.ID_SKU = i.ID_SKU) >= 2) then (dbo.Basket.Value * 0.5)
      else (0)
      end
    )
  where
    dbo.Basket.ID in 
    (select i.ID 
    from Inserted as i)
go
