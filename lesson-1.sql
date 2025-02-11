create database TestDB;
go
use TestDB;
go
create table Users
(
    Id int primary key identity(1,1),
    Name nvarchar(50),
    SurName nvarchar(50)
);
go
create table Accounts
(
    Id int primary key identity(1,1),
    Login nvarchar(50) NOT NULL,
    Password nvarchar(50) NOT NULL,
    UserId int foreign key references Users(Id),
);
go
insert into Users (Name, SurName) values
    ('John', 'Doe'),
    ('Jane', 'Doe'),
    ('Alice', 'Smith'),
    ('Andrij', 'Manin');

insert into Accounts (Login, Password, UserId) values
    ('john_doe', '123456', 1),
    ('jane_doe', '123456', 2),
    ('alice_smith', '123456', 3),
    ('andrij_manin', '123456', 4);

select * from Users;
select * from Accounts;

select Accounts.Login, Accounts.Password, Users.Name + ' ' + Users.SurName as Info from Accounts, Users
    where Accounts.UserId = Users.Id;

drop table Accounts;
drop table Users;
use master
drop database TestDB;
