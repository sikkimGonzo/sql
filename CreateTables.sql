create table dbo.SKU(
    ID int identity not null primary key,
    Code as 's' + cast(ID as varchar(255)) unique,
    Name varchar(255)
)
go

create table dbo.Basket(
    ID int identity not null primary key,
    ID_SKU int not null foreign key references dbo.SKU(ID),
    Quantity int check(Quantity >= 0),
    Value decimal(18, 2) check(Value >= 0),
    PurchaseDate date default getdate(),
    DiscountValue decimal(18, 2)
)
go

create table dbo.Family(
    ID int identity not null primary key,
    SurName varchar(255),
    BudgetValue int
)
go
