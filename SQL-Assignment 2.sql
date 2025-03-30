--1)Write a query to list all system databases in SQL Server.
SELECT name 
FROM sys.databases
WHERE database_id <=5;


--2)Identify the physical database files (MDF, LDF) of a user-defined database named "SalesDB" using a SQL query.
create database salesDB;
use salesDB;
go
select file_id, name, type_desc, physical_name
from sys.database_files;create database inventory

--3) Create a user-defined database named "InventoryDB" with a primary data file of 5MB and a log file of 2MB.
ON PRIMARY  
(  
    NAME = 'InventoryData',  
    FILENAME = 'C:\InventoryFiles\Inventory.mdf',  
    SIZE = 5MB  
)  
LOG ON  
(  
    NAME = 'Inventory_Log',  
    FILENAME = 'C:\InventoryFiles\Inventory.ldf',  
    SIZE = 2MB  
);

--4) Rename the database "InventoryDB" to "StockDB" using a SQL query.
EXEC sp_renamedb 'Inventory', 'StockDB';

--5)Drop the database "StockDB" using a SQL query.

drop database StockDB;


--6)Write a query to display all available data types in SQL Server.

SELECT name AS DataType
FROM sys.types
ORDER BY name;



--7)Create a table "Products" with the following columns:
    --ProductID (Integer, Primary Key)
	 --ProductName (Variable-length string, max 50 characters, Not Null)
     --Price (Decimal with 2 decimal places)
	  --StockQuantity (Integer, Default value 0)
create database ProductDB;
use ProductDB;
create table Products(ProductID int primary key,ProductName varchar(50) not null, Price decimal(10,2),StockQuantity int default 0);


--8)Modify the "Products" table to add a new column Category (VARCHAR(30)).
alter table Products
add Category varchar(30);

--9) Rename the table "Products" to "Inventory".
exec sp_rename 'products','Inventory'


--10)Drop the "Inventory" table from the database.
drop table Inventory;

--11)Identify and list the system databases available in SQL Server. Provide a brief description of each.
SELECT name FROM sys.databases WHERE database_id <= 4;


--12)Write a query to display all database files (MDF, LDF, NDF) for a specific database.
use master;  
go  
SELECT db_name(database_id) AS DatabaseName,  
       name AS FileName,  
       physical_name AS FilePath,  
       type_desc AS FileType  
FROM sys.master_files  
ORDER BY DatabaseName, FileType;

--13)Create a new user-defined database named SalesDB with a primary data file of 10MB and a log file of 5MB.

--14)Rename the database ProductDB to RetailDB using an SQL query.
EXEC sp_renamedb 'ProductDB', 'RetailDB';

--15)Drop the RetailDB database safely, ensuring that no active connections exist before deletion.
drop database RetailDB;