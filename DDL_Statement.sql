/*
										   Name of The Project : SuperShop Market
												Trainee Name : Md Mahmudul Hasan  
						    					  Trainee ID : 1279205       
											   Batch ID : WADA-/PNTL-A/56/01 

-------As we know the common DDL statements are CREATE,MODIFY AND DELETE. With these statements examples are given below.---------

Table of Contents: DDL(DATA DEFINITION LANGUAGE)
				=> PARTITION 01: Create a Database [SuperShopMarket(SSM)]
				=> PARTITION 02: Create Tables with appropriate column definition related with the project
				=> PARTITION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
				=> PARTITION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
				=> PARTITION 05: CREATE SEQUENCE & ALTER SEQUENCE
				=> PARTITION 06: CREATE A VIEW & ALTER VIEW
				=> PARTITION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
				=> PARTITION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
				=> PARTITION 09: CREATE TRIGGER (FOR/AFTER & INSTEAD OF TRIGGER)
*/


/* --------------------------------------PARTITION 01---------------------------------------
   -------------BY Checking Database Existence Then Create Database with Appropiate Attributes---------		
*/

Use master
GO

IF DB_ID('SSM') IS NOT NULL
DROP DATABASE SSM

CREATE DATABASE SSM
ON
(
	name='ssm_date',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ssm_date.mdf',
	size=10mb,
	maxsize=60mb,
	filegrowth=10%
)
LOG ON 
(
	name='ssm_log',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ssm_log.ldf',
	size=5mb,
	maxsize=50mb,
	filegrowth=8mb
)
GO

USE SSM
GO

/* --------------------------------------PARTITION 02---------------------------------------
   -------------Create Tables with appropriate column definition related with the project---------
   ------------------------Using Primary Key,IDENTITY,Constraints------------------------------------------	
*/

CREATE TABLE City
(
	cityID INT PRIMARY KEY,
	cityName VARCHAR(30) DEFAULT 'DHAKA'
)
GO
CREATE TABLE Country
(
	countryID INT PRIMARY KEY,
	countryName VARCHAR(30) DEFAULT 'BANGLADESH'
)
GO
CREATE TABLE Gender
(
	genderID INT IDENTITY PRIMARY KEY,
	genderTitle VARCHAR(20) NOT NULL
)
GO
CREATE TABLE Categories
(
	categoryID INT IDENTITY PRIMARY KEY,
	categoryName VARCHAR(30) DEFAULT 'Mix Product Category'
)
GO
CREATE TABLE DesignationEmp
(
	designationID INT IDENTITY PRIMARY KEY,
	designationName VARCHAR(30)
)
GO
CREATE TABLE StockingProducts
(
	stockID INT IDENTITY PRIMARY KEY,
	productID INT REFERENCES Products(ProductID),
	stockQuantity INT DEFAULT 0
)
GO
/*
 ------------------------Defining Core Table with Primary Key,Foreign Key IDENTITY,Constraints--------------
*/

CREATE TABLE Products
(
	ProductID INT IDENTITY Primary Key, 
	productName VARCHAR(50) NOT NULL,
	productDescript VARCHAR(80) DEFAULT 'Good Condition',
	categoryID INT REFERENCES Categories(categoryID),--foreignKey
	productPrice MONEY,
	productAvailability INT DEFAULT 0,
	supplierID INT REFERENCES Supplier(supplierID)--foreignKey
)
GO

CREATE TABLE Supplier
(
	supplierID INT IDENTITY PRIMARY KEY,
	supplierCompanyName VARCHAR(50) NOT NULL,
	ContactName VARCHAR(50) NOT NULL,
	ContactNumber VARCHAR(30) NOT NULL,
	[Address] VARCHAR(20) NOT NULL
)
GO

CREATE TABLE Employee
(
	empID INT IDENTITY PRIMARY KEY,
	empFname VARCHAR(30) NOT NULL,
	empLname VARCHAR(30) NOT NULL,
	dob DATE NOT NULL,
	nid CHAR(20) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	empPhone CHAR(20) UNIQUE CHECK(empPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	gender INT REFERENCES gender(genderID),
	empAddress VARCHAR(30) NOT NULL,
	city INT REFERENCES city(CityID),
	country INT REFERENCES country(countryID),
	empDesignation VARCHAR(20)
)
GO

---USING Composite Key
CREATE TABLE EmployeeInfo
(
	empID INT REFERENCES Employee(empID),
	designationID INT REFERENCES DesignationEmp(designationID),
	salary INT DEFAULT 0.00,
	PRIMARY KEY(empID,designationID)
)
GO

CREATE TABLE Customers
(
	customerID INT IDENTITY PRIMARY KEY,
	customerName VARCHAR(50) NOT NULL,
	customerPhone CHAR(20) NOT NULL,
	customerAddress VARCHAR(30) NOT NULL ,
	--city INT REFERENCES city(CityID),
	--country INT REFERENCES country(countryID) 
)
GO

CREATE TABLE PaymentType
(
	pTypeID INT IDENTITY PRIMARY KEY,
	paymentMethod VARCHAR(30)
)
GO

CREATE TABLE Payments
(
	paymentID INT IDENTITY PRIMARY KEY,
	paymentDate DATE DEFAULT GETDATE(),
	paymentMethod INT REFERENCES PaymentType(pTypeID),
	customerID INT REFERENCES Customers(customerID),
	paymentTotal MONEY,
	creditTotal MONEY
)
GO

CREATE TABLE ExampleTableToDrop
(
	dropColumnOne INT,
	dropingDescription VARCHAR(30)
)
GO
/* --------------------------------------PARTITION 03---------------------------------------
   -------------Create Tables with appropriate column definition related with the project---------
   ------------------------ALTER, DROP AND MODIFY TABLES & COLUMNS------------------------------------------	
*/

-----------Updating Column Data Type Using Alter--------------

ALTER TABLE Employee
ALTER COLUMN empDesignation INT 
GO

------------ADDING Foreign Key To Existing Table Column Using Alter & Constraint--------

ALTER TABLE Employee
ADD CONSTRAINT fk_designationID
FOREIGN KEY (empDesignation)
REFERENCES DesignationEmp(designationID)
GO

----------ADD Column To Exisisting TABLE -------------------
ALTER TABLE Employee
ADD empEmail VARCHAR(30) 
GO

ALTER TABLE Customers
ADD customerEmail VARCHAR(30)
GO

ALTER TABLE Products
ADD StockQuantity INT
GO

ALTER TABLE ExampleTableToDrop
ADD dropColumnOne INT
GO

-----------ADD CHECK CONSTRAINT with defining name------------
ALTER TABLE Employee
ADD CONSTRAINT Check_EmailValidation CHECK (empEmail LIKE '%@%')
GO

ALTER TABLE Customers
ADD CONSTRAINT Check_CustomerEValidation CHECK (customerEmail LIKE '%@%')
GO

----------DROPING COLUMN & TABLE------------------

ALTER TABLE ExampleTableToDrop
DROP COLUMN dropColumnOne
GO

DROP TABLE ExampleTableToDrop
GO

SELECT * FROM ExampleTableToDrop

/* --------------------------------------PARTITION 04---------------------------------------
   ------------------------ CREATE CLUSTERED AND NONCLUSTERED INDEX------------------------------------------	
*/



CREATE CLUSTERED INDEX INX_Example
ON ExampleTableToDrop 
(
	dropColumnOne
)
GO

CREATE NONCLUSTERED INDEX INX_NidIndexing
ON EmployeeInfo
(
	salary
)
GO

/* --------------------------------------PARTITION 05---------------------------------------
   ------------------------ CREATE SEQUENCE & ALTER SEQUENCE------------------------------------------	
*/

CREATE SEQUENCE SeqFirstOne
	AS INT 
	START WITH 101
	INCREMENT BY 1
	MAXVALUE 1000
GO

--------ALTER SEQUENCE--------

ALTER SEQUENCE SeqFirstOne
	MINVALUE 100
GO

/* --------------------------------------PARTITION 06---------------------------------------
   ------------------------------ CREATE A VIEW & ALTER VIEW------------------------------------------	
*/

--CREATING A VIEW WITH ENCRYPTION & SCHEMABINDING
--View to get Payment Status Datewise

CREATE VIEW vTotalPaymentToday
WITH SCHEMABINDING,ENCRYPTION
AS 
SELECT p.paymentID,p.customerID,p.paymentDate,p.paymentTotal AS 'Total Payment' FROM dbo.Payments p
WHERE CONVERT(DATE,p.paymentDate) = CONVERT(DATE,p.paymentDate)
GO


---ALTER VIEW------------

ALTER VIEW vTotalPaymentToday
AS 
SELECT p.paymentID,p.paymentDate,p.paymentTotal FROM Payments p
GO


/* --------------------------------------PARTITION 07---------------------------------------
   --------------------- CREATE STORED PROCEDURE & ALTER STORED PROCEDURE------------------------------------------	
*/

--CREATING Store Procedure for Inserting Data Into Customer Table Using Input Parameter---------

SELECT * FROM Customers
GO

CREATE PROC sp_InsertToCustomer
							  @nameCustomer VARCHAR(50),
							  @phoneCustomer CHAR(20),
							  @addressCustomer VARCHAR(30),
							  @cityCustomer INT,
							  @countryCustomer INT,
							  @emailCustomer VARCHAR(30)
AS
INSERT INTO Customers(customerName,customerPhone,customerAddress,city,country,customerEmail)
VALUES(@nameCustomer,@phoneCustomer,@addressCustomer,@cityCustomer,@countryCustomer,@emailCustomer)
GO
						
--CREATING Store Procedure for Inserting Data Into Employee Table Using OUTPUT Parameter---------

CREATE PROC sp_InsertToEmployee 
							   @fnameEmp VARCHAR(30),
							   @lnameEmp VARCHAR(30),
							   @dobEmp DATE,
							   @phoneEmp CHAR(20),
							   @genderEmp INT,
							   @addressEmp VARCHAR(30),
							   @cityEmp INT,
							   @countryEmp INT,
							   @designationEmp INT,
							   @emailEmp VARCHAR(30),
							   @id INT OUTPUT
AS
INSERT INTO Employee(empFname,empLname,dob,empPhone,gender,empAddress,city,country,empDesignation,empEmail)
VALUES(@fnameEmp,@lnameEmp,@dobEmp,@phoneEmp,@genderEmp,@addressEmp,@cityEmp,@countryEmp,@designationEmp,@emailEmp)
SELECT @id = IDENT_CURRENT('Employee')
GO

--CREATING Store Procedure for Updating Data Into DesignationEmp Table---------

CREATE PROC sp_UpdateData
						@idDesignation INT,
						@nameDesignation VARCHAR(30)
AS
BEGIN
	UPDATE DesignationEmp
	SET designationName = @nameDesignation
	WHERE designationID = @idDesignation
END
GO

--CREATING Store Procedure for DELETING Data From Product Table---------

CREATE PROC sp_DeleteProduct
							@idProduct INT
AS
BEGIN
	DELETE FROM Products
	WHERE ProductID = @idProduct
END
GO

--ALTER Store Procedure---------

ALTER PROC sp_UpdateData
						@idDesignation INT,
						@nameDesignation VARCHAR(30)
AS
BEGIN
	INSERT INTO DesignationEmp(designationID,designationName)
	VALUES(@idDesignation,@nameDesignation)
END
GO

/* --------------------------------------PARTITION 08---------------------------------------
   --------CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION--------------
*/

------CREATING SCALAR Function To Get Sales oF CurrentMonth------------

ALTER FUNCTION funcGetCurrentSalesOfMonth()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalSales MONEY
	SELECT @totalSales = SUM(ALL paymentTotal)
	FROM Payments
	WHERE MONTH(payments.paymentDate) = MONTH(payments.paymentDate)
	RETURN @totalSales
END
GO

------CREATING Simple/Inline Table VALUED Function To Get Sales oF Specific Year & Month------------

CREATE FUNCTION funcSalesWithSpecificDate(@year INT,@month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	SUM(ALL paymentTotal) AS 'Total Payment',
	SUM(ALL creditTotal) AS 'Total Credit'
	FROM Payments
	WHERE YEAR(Payments.paymentDate) = @year AND MONTH(Payments.paymentDate) = @month
)
GO
------CREATING Multi Table VALUED Function To Get Sales oF Specific Year & Month------------

CREATE FUNCTION funcSalesWithSpecificYM(@year INT,@month INT)
RETURNS @netSales TABLE
(
	idPayment INT,
	datePayment DATE,
	Totalpayment MONEY,
	Totalcredit MONEY
)
AS
BEGIN
	INSERT INTO @netSales
	SELECT 
	paymentID,
	paymentDate,
	SUM(ALL paymentTotal),
	SUM(ALL creditTotal)
	FROM Payments
	WHERE YEAR(Payments.paymentDate) = @year AND MONTH(Payments.paymentDate) = @month
	GROUP BY paymentID,paymentDate
	RETURN
END
GO

------ALTER FUNCTION------------

ALTER FUNCTION funcGetCurrentSalesOfMonth(@totalCredit MONEY )
RETURNS MONEY
AS
BEGIN
	SELECT @totalCredit = SUM(creditTotal)
	FROM Payments
	WHERE MONTH(payments.paymentDate) = MONTH(GETDATE())
	RETURN @totalCredit
END
GO

/* --------------------------------------PARTITION 09------------------------------------
   ----------------------CREATE TRIGGER (FOR/AFTER & INSTEAD OF TRIGGER)-----------------
*/

-----CREATE FOR/AFTER TRIGGER WHEN 
--the Product table that updates the productAvailability column whenever 
--there is an INSERT or UPDATE operation on the Price or StockQuantity columns-----------

CREATE TRIGGER tr_Product_UpdateAvailability
ON Products
AFTER INSERT, UPDATE
AS
BEGIN
    -- Check for changes in Price or StockQuantity
    IF UPDATE(productPrice) OR UPDATE(StockQuantity)
    BEGIN
        UPDATE p
        SET productAvailability = 
            CASE 
                WHEN p.StockQuantity > 0 THEN 1
                ELSE 0 
            END
        FROM Products p
        INNER JOIN inserted i ON p.ProductID = i.ProductID;
    END
END;
GO

------------INSTEAD OF TRIGGER-----------------------
-- CREATE INSTEAD OF DELETE TRIGGER FOR PRODUCT TABLE Prevent direct deletion of products with positive stock quantity------
CREATE TRIGGER tr_InsteadOfDeleteProduct
ON Products
INSTEAD OF DELETE
AS
BEGIN
    -- Update StockQuantity to zero for products with positive stock quantity
    UPDATE p
    SET p.StockQuantity = 0,p.productAvailability = 0
    FROM Products p
    JOIN deleted d ON p.ProductID = d.ProductID
    WHERE p.StockQuantity > 0;
END;
GO

-------INSTEAD OF TRIGGER ON VIEW-------------

CREATE TRIGGER Tr_onVIEW
ON vTotalPaymentToday
INSTEAD OF INSERT
AS
BEGIN 
	INSERT INTO Payments(payments.paymentID,payments.paymentDate,payments.paymentTotal)
	SELECT i.paymentID,i.paymentDate,i.paymentTotal FROM inserted i
END
GO


---------------------------------------------------------END OF THE DDL PARTITION-------------------------------------------------------------------
----------------------------------------------------------------THANK YOU--------------------------------------------------------------------------