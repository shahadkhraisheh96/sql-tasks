--step 1
CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Departments (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentId INT
);

CREATE TABLE Projects (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Budget DECIMAL(10,2)
);

CREATE TABLE EmployeeProjects (
    Id INT PRIMARY KEY,
    EmployeeId INT,
    ProjectId INT
);


INSERT INTO Departments (Id, Name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales');


INSERT INTO Employees (Id, Name, Salary, DepartmentId)
VALUES
(1, 'Ahmad', 1000, 1),
(2, 'Ali', 1500, 1),
(3, 'Sara', 1200, 2),
(4, 'Omar', 2000, 3),
(5, 'Lina', 1800, 3);


INSERT INTO Projects (Id, Name, Budget)
VALUES
(1, 'Website', 5000),
(2, 'Mobile App', 8000),
(3, 'CRM System', 6000);


INSERT INTO EmployeeProjects (Id, EmployeeId, ProjectId)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 2);

--task1
SELECT COUNT(*) employeeCount FROM Employees;

--task2
SELECT SUM(Salary) SumOfSalary From Employees;

--task3 
SELECT AVG(Salary) AVGOfSalary From Employees;

--task4
SELECT MAX(Salary) "Maximum salary" , MIN(Salary) MinmumSalary From Employees;

--task5
SELECT COUNT(*) From Employees 
WHERE Salary > 1500;

--task6
SELECT  DepartmentId,COUNT(*) AS numberOfEmployee FROM Employees 
GROUP BY DepartmentId;

--task7
SELECT  DepartmentId,Sum(Salary) AS SumOfSalray FROM Employees 
GROUP BY DepartmentId;

--task8
SELECT  DepartmentId,AVG(Salary) AS AVGOfSalray FROM Employees 
GROUP BY DepartmentId;

--task9
SELECT  DepartmentId,COUNT(*) AS numberOfEmployee FROM Employees 
GROUP BY DepartmentId
HAVING COUNT(*) >1;

--task10
SELECT  DepartmentId , SUM(Salary) FROM Employees 
GROUP BY DepartmentId
HAVING SUM(Salary) >2500;

--task11
SELECT Employees.Name as "employee name", Departments.Name as "deparment name"  from Employees
join Departments
on Employees.DepartmentId = Departments.Id

--task12
SELECT Employees.Name as "employee name", Projects.Name as "project name"  from EmployeeProjects
join Employees
on Employees.Id = EmployeeProjects.EmployeeId 
join Projects 
on EmployeeProjects.ProjectId = Projects.Id


--task13
SELECT COUNT(Employees.Id) as "employee Count", Projects.Name as "project name"  from EmployeeProjects
join Employees
on Employees.Id = EmployeeProjects.EmployeeId 
join Projects 
on EmployeeProjects.ProjectId = Projects.Id
group by Projects.Name


--task14
SELECT sum(Employees.Salary) as "employee sum salary", Projects.Name as "project name"  from EmployeeProjects
join Employees
on Employees.Id = EmployeeProjects.EmployeeId 
join Projects 
on EmployeeProjects.ProjectId = Projects.Id
group by Projects.Name








--task15
SELECT Employees.name as "employee sum salary", 
Projects.Name as "project name"  
from EmployeeProjects
join Employees
on Employees.Id = EmployeeProjects.EmployeeId 
join Projects 
on EmployeeProjects.ProjectId = Projects.Id
where Projects.Name = 'Mobile App';



--task16
SELECT name FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

--TASK17
SELECT TOP 2 * from Employees
order by Salary DESC ;

--task18

SELECT Employees.name as "employee name", 
Projects.Name as "project name"  
from EmployeeProjects
join Employees
on Employees.Id = EmployeeProjects.EmployeeId 
join Projects 
on EmployeeProjects.ProjectId = Projects.Id
where Projects.Name = null;

--task19
CREATE INDEX idx_eployee_name
ON Employees(Name);

SELECT * FROM Employees;

--task20
Create INDEX idx_users_name_salary
ON Employees(Name, Salary);

--task21
DROP INDEX idx_users_name_salary on Employees;

--task22

--task23
--SELECT*FROM Employees
--WHERE Name = @Name AND Password=@Password;


