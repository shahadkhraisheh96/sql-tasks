--step1
CREATE DATABASE StoreDB;

USE StoreDB;

CREATE TABLE Users (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Age INT
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY,
    UserId INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

--step2
--1
INSERT INTO Users(Id,Name,Email,Age)
VALUES 
(1,'Ahmad','ahmad@gmail.com',25),
(2,'Ali','ali@gmail.com',30),
(3,'Sara','sara@gmail.com',22);
--2
INSERT INTO Orders (Id,UserId,ProductName,Price)
VALUES 
(1,1,'Laptop',	800),
(2,	2	,'Phone'	,500),
(3,	1,	'Mouse'	,20),
(4,	3	,'Keyboard',	50);
--3
INSERT INTO Users(Id,Name,Age)
VALUES (4,'Omar',28);

--step3

--task4
UPDATE Users
SET Email = 'sara_new@gmail.com'
WHERE Name='Sara'; 

--task5

UPDATE Orders
SET Price=Price+10;

--task6 
UPDATE Users 
SET Name ='Ali Ahmad'
WHERE Id=2;

--step4
--task7
DELETE FROM Users
WHERE Id=4;

--task8
DELETE FROM Orders
WHERE Price<50;

--task9
DELETE FROM Orders
WHERE Id=3;

--step5
--task10
SELECT * FROM Users;

--task11
SELECT Name,Email FROM Users;

--task12
SELECT * FROM Users WHERE Age >25;

--task13 
SELECT * FROM Users WHERE Name LIKE 'A%';

--task14 
SELECT * FROM Users WHERE Email IS Null;

--task15
SELECT * FROM Orders WHERE Price BETWEEN 50 AND 800;

--task16
SELECT * FROM Orders WHERE ProductName LIKE '%Phone%' ;

--task17
SELECT * FROM Orders ORDER BY  Price DESC;

--task18
SELECT Name FROM USers
WHERE Age <30 
ORDER BY Name ;

--task19 
SELECT * FROM Orders 
WHERE Price>100 AND Id=1 ;

--task20
SELECT * FROM Users WHERE (Age BETWEEN 20 AND 30 ) AND Name LIKE 'a%' ;

