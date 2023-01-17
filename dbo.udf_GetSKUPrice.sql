create function dbo.udf_GetSKUPrice(@ID_SKU as int)
returns decimal(18, 2)
  begin
    declare @val decimal;
    declare @qua decimal;
    select 
      	@val = sum(Value),
        @qua = sum(Quantity)
    from dbo.Basket as b
	  where b.ID_SKU = @ID_SKU;
    return @val / @qua
  end
go
