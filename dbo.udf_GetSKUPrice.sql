create function dbo.udf_GetSKUPrice(@ID_SKU as int)
returns decimal(18, 2)
  begin
    declare @val decimal;
    select @val = Value from dbo.Basket as b
                  where b.ID_SKU = @ID_SKU;
    declare @qua decimal;
    select @qua = Quantity from dbo.Basket as b
                  where b.ID_SKU = @ID_SKU;
    return @val / @qua
  end
go
