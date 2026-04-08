--1
CREATE DATABASE OnlineStore;
USE OnlineStore;
--2
CREATE TABLE Users(
Id INT PRIMARY KEY ,
Name NVARCHAR(50) NOT NULL);
--3
ALTER TABLE Users 
ADD Email NVARCHAR(50) NOT NULL;
--4
CREATE TABLE Produts(
Id INT PRIMARY KEY ,
Name NVARCHAR(50) NOT NULL,
Price DECIMAL(10,2) NOT NULL 
);
--5 
ALTER TABLE Products
ALTER COLUMN Price DECIMAL(10,2) NOT NULL;
--6
CREATE TABLE Orders(
Id INT PRIMARY KEY ,
UserId INT NOT NULL,
 FOREIGN KEY (UserId)REFERENCES Users(Id));
 --7 
 ALTER TABLE Orders
ADD dateOfOrder DATETIME NOT NULL ;
--8
ALTER TABLE Orders 
ADD CONSTRAINT DF_Orders_dateOfOrder 
DEFAULT GETDATE() FOR dateOfOrder;
--9
CREATE TABLE ProductsInsideOrders(
product_id INT NOT NULL,
order_id INT NOT NULL,
CONSTRAINT pk_ProductsInsideOrders PRIMARY KEY (product_id,order_id));
--10
CREATE TABLE Categories(
category_id INT PRIMARY KEY,
name NVARCHAR(15) NOT NULL);

ALTER TABLE Produts
ADD category_id INT;

ALTER TABLE Produts
ADD CONSTRAINT fk_products_categoryID
FOREIGN KEY (category_id) REFERENCES Categories(category_id); 

--11
CREATE TABLE Employees(
employee_id INT PRIMARY KEY,
name NVARCHAR(15),
manager_id INT,
CONSTRAINT fk_employee_managerID FOREIGN KEY (manager_id) REFERENCES Employees(employee_id));

--12
ALTER TABLE Users 
ADD Phone NVARCHAR(50) NOT NULL;

--13
ALTER TABLE Users 
DROP COLUMN Phone;

--14
ALTER TABLE Users
ALTER COLUMN Name NVARCHAR(35);

--15
CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
name NVARCHAR(15) NOT NULL,
phone INT );

--16
CREATE TABLE Payments(
payment_id INT PRIMARY KEY,
order_id INT,
CONSTRAINT fk_payment_orderID FOREIGN KEY (order_id) REFERENCES Orders(Id));

-- 17
CREATE TABLE Students(
Std_id INT PRIMARY KEY,
name NVARCHAR(15) NOT NULL);

-- 18
CREATE TABLE Courses(
course_id INT PRIMARY KEY,
title NVARCHAR(25) );

-- 19
CREATE TABLE Enrollment(
student_id INT,
course_id INT,
CONSTRAINT pk_enrollment PRIMARY KEY (student_id, course_id),
CONSTRAINT fk_enrollment_studentID FOREIGN KEY (student_id) REFERENCES Students(Std_id),
CONSTRAINT fk_enrollemtn_course_id FOREIGN KEY (course_id) REFERENCES Courses(course_id));

-- 20
CREATE TABLE Logs(
log_id INT PRIMARY KEY,
message NVARCHAR(30),
timestamp DATETIME
);

-- 21
TRUNCATE TABLE Logs;

-- 22
ALTER TABLE Logs
DROP COLUMN timestamp;

-- 23
DROP TABLE Enrollment;

-- 24
CREATE TABLE NewTable(
table_id INT IDENTITY PRIMARY KEY,
name NVARCHAR(10));

-- 25
CREATE TABLE TestTable(
table_id INT PRIMARY KEY,
must INT NOT NULL,
optional INT);

-- 26
CREATE TABLE Books(
title NVARCHAR(30) PRIMARY KEY,
price DECIMAL(3,2));

-- 27
CREATE TABLE Author(
author_id INT PRIMARY KEY,
author_name NVARCHAR(20));

-- one author can have many books
ALTER TABLE Books 
ADD author_id INT;

ALTER TABLE Books
ADD CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Author(author_id);

-- 28
CREATE TABLE IdsTable(
order_id INT,
employee_id INT,
category_id INT,
CONSTRAINT pk_IdsTable PRIMARY KEY (order_id,employee_id,category_id),
CONSTRAINT fk_IdsTable_order_id FOREIGN KEY (order_id) REFERENCES Orders(Id),
CONSTRAINT fk_IdsTable_employee_id FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
CONSTRAINT fk_IdsTable_category_id FOREIGN KEY (category_id) REFERENCES Categories(category_id));

-- 29
CREATE TABLE AllTable(
TableID INT PRIMARY KEY,
names NVARCHAR(20),
dates DATE);

-- 30
CREATE TABLE AllTable2(
TableID INT PRIMARY KEY,
names NVARCHAR(20),
dates DATE);

ALTER TABLE AllTable2
ADD CONSTRAINT uq_AllTable_names UNIQUE (names);





