--1) Write a query to list all system databases available in MS SQL Server.
select name as DatabaseName from sys.databases where database_id<=4;


--2) Write a query to retrieve the physical file locations (MDF & LDF) of a database named "CompanyDB".
create database companydb  
on primary  
(  
    name = 'companydb_data',  
    filename = 'c:\sqldata\companydb.mdf',  
    size = 10mb,  
    maxsize = 100mb,  
    filegrowth = 5mb  
)  
log on  
(  
    name = 'companydb_log',  
    filename = 'c:\sqldata\companydb.ldf',  
    size = 5mb,  
    maxsize = 50mb,  
    filegrowth = 2mb  
);  

use master;  
go  

select name as filename,  
       physical_name as filepath,  
       type_desc as filetype  
from sys.master_files  
where database_id = db_id('companydb');  


--3) Write a query to create a database "HRDB" with the following specifications:
--Primary Data File: 10MB, Autogrow by 2MB
--Log File: 5MB, Autogrow by 1MB

create database hrdb  
on primary  
(  
    name = 'hrdb_data',  
    filename = 'c:\sqldata\hrdb.mdf',  
    size = 10mb,  
    filegrowth = 2mb  
)  
log on  
(  
    name = 'hrdb_log',  
    filename = 'c:\sqldata\hrdb.ldf',  
    size = 5mb,  
    filegrowth = 1mb  
);


--4) Rename "HRDB" to "EmployeeDB" using SQL commands.
exec sp_renamedb 'HRDB','EmployeeDB';



--5) Drop the database "EmployeeDB" from the system.
drop database EmployeeDB;



--6)Write a query to display all supported data types in MS SQL Server.
select name as datatype 
from sys.types 
order by name;


--7)Create a table "Employees" with the following fields:
--EmpID (Integer, Primary Key)
--EmpName (Variable-length string, max 100 characters, Not Null)
--JoinDate (Date, Not Null)
--Salary (Decimal with 2 decimal places, Default: 30000.00)
create database Employee;
use Employee;
create table Employees(EmpId int primary key,
EmpName varchar(100) not null,
JoinDate Date not null,
salary decimal(10,2) default 30000.00);


--8)Add a new column "Department" (VARCHAR(50)) to the "Employees" table.
alter table Employees
add Department varchar(50);

--9)Rename the table "Employees" to "Staff".
exec sp_rename 'Employees','Staff';

--10)Drop the table "Staff" from the database.
drop table staff;

