-- Learn MySQL

-- CREATE Customer Table
CREATE TABLE IF NOT EXISTS Customers (
    ID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255),
    LastName varchar(255),
    City varchar(255),
    ZipCode int,
    PRIMARY KEY (ID)
);

INSERT INTO
	Customers(FirstName, LastName, City, ZipCode)
VALUES
	('John', 'Smith', 'New York', 10199),
	('David', 'Williams', 'Los Angeles', 90052),
	('Chloe', 'Anderson', 'Chicago', 60697),
	('Emily', 'Adams', 'Houston', 77201),
	('James', 'Roberts', 'Philadelphia', 19104);


-- SELECT Statement
/*The SELECT statement is used to select data from a database.*/
/*SQL allows to run multiple queries or commands at the same time.*/
/*SQL is case insensitive.*/
/*A single SQL statement can be placed on one or more text lines.
  White spaces and multiple lines are ignored in SQL.*/
SELECT FirstName FROM Customers;
SELECT City FROM Customers;

-- Selecting Multiple Columns
SELECT FirstName, LastName, City
FROM Customers;

-- Selecting All Columns
SELECT * FROM Customers;

-- Problem SQL Selecting Multiple Columns
CREATE TABLE IF NOT EXISTS Products (
    ProductName varchar(255),
    Price decimal(10,2),
    ProductionDate timestamp,
    ExpirationDate timestamp
);

INSERT INTO
	Products(ProductName, Price, ProductionDate, ExpirationDate)
VALUES
	('Yogurt', 200, '2020-11-19', '2021-01-19'),
	('Juice', 380, '2020-10-10', '2022-10-10'),
	('Milk', 520, '2020-08-19', '2020-08-23');

SELECT ProductName,
       ProductionDate,
       ExpirationDate
FROM Products;

-- DISTINCT Keyword
/*The SQL DISTINCT keyword is used in conjunction with SELECT
  to eliminate all duplicate records and return only unique ones.*/
INSERT INTO
	Customers(FirstName, LastName, City, ZipCode)
VALUES
	('Andrew', 'Thomas', 'New York', 10199),
	('Daniel', 'Harris', 'New York', 90052),
	('Charlotte', 'Walker', 'Chicago', 60697),
	('Samuel', 'Clark', 'San Diego', 92121),
	('Anthony', 'Young', 'Los Angeles', 90052);

SELECT DISTINCT City FROM Customers;

-- Problem Customer Copy
CREATE TABLE IF NOT EXISTS Operations (
    ID int NOT NULL AUTO_INCREMENT,
    Checks varchar(255),
    PRIMARY KEY (ID)
);

INSERT INTO
    Operations(Checks)
VALUES
    ('Check 1'),
    ('Check 2'),
    ('Check 3'),
    ('Check 1'),
    ('Check 2'),
    ('Check 3');

SELECT DISTINCT Checks FROM Operations;

-- LIMIT Keyword
/*To retrieve just a subset of records.*/
SELECT * FROM Customers
LIMIT 5;

-- OFFSET Keyword
/* To pick up a set of records from a particular offset.*/
SELECT * FROM Customers
LIMIT 4 OFFSET 3;

SELECT * FROM Customers
LIMIT 3, 4;

-- Fully Qualified Names
/*In SQL, can provide the table name prior
  to the column name, by separating them with a dot.*/
SELECT City FROM Customers;
SELECT Customers.City FROM Customers;

-- ORDER BY
/*To sort the returned data.*/
/*By default, the ORDER BY keyword sorts the results in ascending order.*/
SELECT * FROM Customers
ORDER BY FirstName;

-- Problem Sorting Result
CREATE TABLE IF NOT EXISTS Players (
    FirstName varchar(255),
    LastName varchar(255),
    Losses int
);

INSERT INTO
    Players(FirstName, LastName, Losses)
VALUES
    ('Hikaru', 'Nakamura', 0),
    ('Magnus', 'Karlsen', 2),
    ('Wesley', 'So', 3),
    ('Levon', 'Aronian', 3),
    ('Haik', 'Martirosian', 1),
    ('Vladimir', 'Fedoseev', 1);

SELECT * FROM Players
ORDER BY Losses;

-- Sorting Multiple Columns
/*The ORDER BY command starts ordering in the same sequence as the columns.*/
DELETE FROM Customers
WHERE ID IN (8, 9, 10);

ALTER TABLE Customers
ADD COLUMN Age int;

UPDATE Customers
SET Age = (
    CASE
        WHEN (ID = 1) THEN 35
        WHEN (ID = 2) THEN 23
        WHEN (ID = 3) THEN 27
        WHEN (ID = 4) THEN 34
        WHEN (ID = 5) THEN 31
        WHEN (ID = 6) THEN 45
        WHEN (ID = 7) THEN 30
    END
    )
WHERE ID IN (1,2,3,4,5,6,7);

UPDATE Customers
SET LastName = 'Smith'
WHERE ID = 2;

SELECT * FROM Customers
ORDER BY LastName, Age;

-- Module 1 Quiz (Cakes)
/*A local bakery creates unique cake sets.
  Each cake set contains three different cakes.*/

CREATE TABLE IF NOT EXISTS Cakes (
    Name varchar(255),
    Calories int
);

INSERT INTO
    Cakes(Name, Calories)
VALUES
    ('Apple Cake', 100),
    ('Banana Cake', 200),
    ('Pound Cake', 180),
    ('Sponge Cake', 100),
    ('Genoise Cake', 360),
    ('Chiffon Cake', 250),
    ('Opera Cake', 90),
    ('Cheese Cake', 370);

SELECT *
FROM Cakes
ORDER BY Calories
LIMIT 3;
