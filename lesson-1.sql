create database HospitalDB;
go
use HospitalDB;
go
create table Departments(
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Financing money not null check(Financing >= 0) default 0,
    Name nvarchar(100) not null unique
);
go
create table Diseases(
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null unique,
    Severity int not null check (Severity >= 1) default 1
);
go
create table Doctors(
    Id int primary key identity(1,1) not null,
    Name nvarchar(max) not null,
    Surname nvarchar(max) not null,
    Phone char(10) not null,
    Salary money not null check(Salary >= 0),
);
go
create table Examinations(
    Id int primary key identity(1,1) not null,
    DayOfWeek int not null check(DayOfWeek between 1 and 7),
    EndTime time not null /*check(EndTime >= StartTime)*/,
    StartTime time not null check(StartTime between '08:00:00' and '18:00:00'),
    Name nvarchar(100) not null unique
);
go

insert into Departments (Building, Financing, Name) values
    (1, 2300000, 'Central Hospital'),
    (2, 500000, 'DownTown Hospital');

insert into Diseases (Name, Severity) values
    ('Flu', 1),
    ('Covid-19', 3),
    ('Cancer', 5);

insert into Doctors (Name, Phone, Salary, Surname) values
    ('John', '1234567890', 100000, 'Doe'),
    ('Jane', '1234567890', 100000, 'Doe'),
    ('Alice', '1234567890', 100000, 'Smith'),
    ('Andrij', '1234567890', 100000, 'Manin');

insert into Examinations (DayOfWeek, EndTime, StartTime, Name) values
    (1, '12:00:00', '08:00:00', 'Blood Test'),
    (2, '12:00:00', '08:00:00', 'X-Ray'),
    (3, '12:00:00', '08:00:00', 'MRI');

select * from Departments;
select * from Diseases;
select * from Doctors;
select * from Examinations;

drop table Departments;
drop table Diseases;
drop table Doctors;
drop table Examinations;

use master
drop database HospitalDB;
