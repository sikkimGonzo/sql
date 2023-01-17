create procedure dbo.usp_MakeFamilyPurchase
  @FamilySurName varchar(255)
as
begin
  if not exists(select SurName from dbo.Family where SurName = @FamilySurName)
    throw 51000, 'The record does not exist.', 1;
  begin try
    update dbo.Family
    set BudgetValue = BudgetValue - (select sum(Value) from dbo.Basket)
    where SurName = @FamilySurName
  end try
  begin catch
    select 
      error_number() as errNum,
      error_message() as errMess,
      error_state() as errState
  end catch
end
go
