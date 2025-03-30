/*Section A: Storing and Manipulating Data (15 Marks)
1. Storing Data in a Table (3 Marks)
a) Write an SQL query to create a table named Employees with the following fields:
•	EmployeeID (Primary Key, INT, Auto-increment)
•	Name (VARCHAR(100), NOT NULL)
•	Age (INT)
•	Department (VARCHAR(50))
•	Salary (DECIMAL(10,2))
b) Insert three records into the Employees table.*/

create database emp;
use emp;
create table Employees(EmployeeID int IDENTITY(1,1) primary key ,
Name varchar(100) not null,
Age int,
Department varchar(50),
salary decimal(10,2));
insert into employees (name, age, department, salary)
values 
    ('aaa', 24, 'hr', 50000.00),
    ('bbb', 30, 'it', 75000.50),
    ('ccc', 27, 'finance', 62000.75);




/*2. Updating Data in a Table (3 Marks)
Write an SQL query to update the Salary of employees in the HR department by 10%.*/
update Employees
set salary=salary*1.10
where department='hr'
select * from employees




/*3. Deleting Data from a Table (3 Marks)
Write an SQL query to delete all employees from the IT department.*/
delete from Employees
where department='it'
select*from Employees



/*4. Demo: Manipulating Data in Tables (6 Marks)
a) Insert a new employee into the Employees table, but ensure the Salary is at least 30000. (2 Marks)
b) Update the Department of employees who earn more than 50000 to Senior Staff. (2 Marks)
c) Delete employees older than 60 years from the table. (2 Marks)*/

alter table employees
add constraint min_salary check (salary>=30000)
insert into employees values('ddd',25, 'operations', 45000);
select * from employees

update employees
set department='Senior staff'
where salary>50000
select * from employees

delete from employees
where age>60



/*5. Retrieving Specific Attributes (3 Marks)
Write an SQL query to retrieve only the Name and Salary of all employees.*/
select name,salary from employees;



/*6. Retrieving Selected Rows (3 Marks)
Write an SQL query to retrieve employees from the HR department who have a salary greater than 50,000.*/
select name from employees
where salary>50000


--Write an SQL query to retrieve all employees sorted by Salary in descending order.
select *from employees 
order by salary desc

/*
8. Filtering Data - WHERE Clauses (5 Marks)
a) Write an SQL query to retrieve employees whose Age is greater than 30. (2 Marks)
b) Retrieve employees whose Department is either HR or Finance. (3 Marks)*/
select age from employees
where age>30

select name from employees
where Department='hr' or department= 'finance'



/*9. Filtering Data - Operators (10 Marks)
a) Retrieve employees whose Salary is between 30,000 and 60,000. (2 Marks)
b) Retrieve employees whose Name starts with "A". (2 Marks)
c) Retrieve employees who do NOT belong to the IT department. (2 Marks)
d) Retrieve employees whose Department is either "Sales" or "Marketing" using the IN operator. (2 Marks)
e) Retrieve employees with distinct Department names. (2 Marks)*/

select * from employees
where salary>30000 and salary<60000

select * from employees
where name like 'a%'

select * from employees
where department not in ('it')

select * from employees
where department='Sales' or department ='Marketing'
select* from employees  
where department in ('sales', 'marketing');

select distinct department from employees


/*10. Column & Table Aliases (3 Marks)
Write an SQL query that retrieves EmployeeID, Name, and Salary, renaming EmployeeID as "ID" and Salary as "Monthly Income".*/
EXEC sp_rename 'employees.EmployeeID', 'ID', 'COLUMN';  
EXEC sp_rename 'employees.salary', 'Monthly Income', 'COLUMN';

--11. Demo: Filtering Data (4 Marks)
--Write an SQL query to retrieve employees whose Name contains "John" and whose salary is greater than 40,000.
 select * from employees
 where name='John' and salary>40000
