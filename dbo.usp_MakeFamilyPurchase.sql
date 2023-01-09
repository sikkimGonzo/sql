create procedure dbo.usp_MakeFamilyPurchase 
  @FamilySurName varchar(255)
as
  if exists(select SurName from dbo.Family where SurName = @FamilySurName)
      begin
          update dbo.Family
          set BudgetValue = BudgetValue - 1 -- Family и Basket не связаны
          where SurName = @FamilySurName
      end;
  else
      select 'SurName not found'
go
