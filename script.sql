create database NewHospitalDB
go
use NewHospitalDB
go

create table Departments(
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Floor int not null check(Floor >= 1),
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
    Salary money not null check(Salary > 0),
    Premium money not null check (Premium >= 0) default 0,
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
create table Wards(
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Floor int not null check(Floor >= 1),
    Name nvarchar(20) not null unique,
);
go

insert into Departments(Building, Floor, Financing, Name) values
                                                              (1, 1, 1000000, 'Cardiology'),
                                                              (1, 2, 2000000, 'Neurology'),
                                                              (2, 1, 1500000, 'Oncology'),
                                                              (2, 2, 3000000, 'Traumatology'),
                                                              (3, 1, 13500, 'Gynecology'),
                                                              (3, 2, 14000, 'Pediatrics'),
                                                              (5, 1, 8000, 'Ophthalmology'),
                                                              (5, 2, 9000, 'Dermatology'),
                                                              (5, 1, 10000, 'Urology'),
                                                              (5, 2, 1100000, 'Endocrinology');
go
insert into Diseases(Name, Severity) values
                                      ('Heart attack', 5),
                                      ('Stroke', 5),
                                      ('Cancer', 5),
                                      ('Fracture', 4),
                                      ('Pregnancy', 3),
                                      ('Flu', 2),
                                      ('Cataract', 2),
                                      ('Acne', 1),
                                      ('Kidney stones', 3),
                                      ('Diabetes', 4);
go
insert into Doctors(Name, Surname, Phone, Salary, Premium) values
                                                            ('John', 'Doe', '1234567890', 100000, 10000),
                                                            ('Jane', 'Doe', '0987654321', 90000, 9000),
                                                            ('Jack', 'Smith', '1234567890', 80000, 8000),
                                                            ('Jill', 'Smith', '0987654321', 70000, 7000),
                                                            ('James', 'Johnson', '1234567890', 60000, 6000),
                                                            ('Jenny', 'Johnson', '0987654321', 50000, 5000),
                                                            ('Jim', 'Brown', '1234567890', 40000, 4000),
                                                            ('Judy', 'Brown', '0987654321', 30000, 3000),
                                                            ('Joe', 'White', '1234567890', 20000, 2000),
                                                            ('Jasmine', 'White', '0987654321', 10000, 1000);
go
insert into Examinations(DayOfWeek, EndTime, StartTime, Name) values
                                                                (1, '12:00:00', '08:00:00', 'Blood test'),
                                                                (2, '12:00:00', '08:00:00', 'Urine test'),
                                                                (3, '12:00:00', '08:00:00', 'X-ray'),
                                                                (4, '12:00:00', '08:00:00', 'MRI'),
                                                                (5, '12:00:00', '08:00:00', 'CT'),
                                                                (6, '12:00:00', '08:00:00', 'Ultrasound'),
                                                                (7, '12:00:00', '08:00:00', 'ECG');
go
insert into Wards(Building, Floor, Name) values
                                        (1, 1, 'Cardiology'),
                                        (1, 2, 'Neurology'),
                                        (2, 1, 'Oncology'),
                                        (2, 2, 'Traumatology'),
                                        (3, 1, 'Gynecology'),
                                        (3, 2, 'Pediatrics'),
                                        (4, 1, 'Ophthalmology'),
                                        (4, 2, 'Dermatology'),
                                        (5, 1, 'Urology'),
                                        (5, 2, 'Endocrinology');
go

select * from Wards;
select Surname, Phone from Doctors;
select distinct Floor from Wards;
select Name, Severity from Diseases where Name like '%Stroke%' and Severity = 5;
select Name, Salary as 'Monthly salary', Premium as 'Monthly premium' from Doctors where Salary > 30000;
select Name, Financing as 'Annual financing' from Departments where Financing > 1000000;
select Name, StartTime, EndTime as 'Examinations' from Examinations where StartTime < '10:00:00' and EndTime > '10:00:00';
select Name from Departments where Building = 5 and Financing < 30000;
select Name from Departments where Building = 3 and Financing between 12000 and 15000;
select Name from Wards where Building between 4 and 5 and Floor = 1;
select Name, Building, Financing from Departments where Building between 3 and 6 and Financing < 11000 or Financing > 25000;
select Surname from Doctors where Salary + Premium > 1500;
select Surname from Doctors where Salary / 2 > Premium * 3;
select distinct Name from Examinations where DayOfWeek between 1 and 3 and StartTime = '12:00:00' and EndTime = '15:00:00';
select Name, Building from Departments where Building in (1, 3, 8, 10);
select Name from Diseases where Severity not in (1, 2);
select Name from Departments where Building not in(1, 3);
select Name from Departments where Building in (1, 3);
select Surname from Doctors where Surname like 'W%';
