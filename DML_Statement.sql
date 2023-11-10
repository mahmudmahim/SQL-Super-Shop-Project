/*
											   Name of The Project : SuperShop Market
													Trainee Name : Md Mahmudul Hasan  
						    						  Trainee ID : 1279205       
												   Batch ID : WADA-/PNTL-A/56/01 

-------As we know the common DML statements are INSERT,UPDATE,DELETE,RETRIEVE DATA AND QUERIES . With these statements examples are given below.----

Table of Contents: DML(DATA MANIPULATION LANGUAGE)
				=> PARTITION 01: INSERT DATA USING INSERT INTO KEYWORD
				=> PARTITION 02: INSERT,UPDATE,DELETE DATA THROUGH STORED PROCEDURE
				=> PARTITION 03: INSERT DATA USING SEQUENCE VALUE
				=> PARTITION 04: INSERT,UPDATE,DELETE DATA THROUGH VIEW
				=> PARTITION 05: RETRIEVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
				=> PARTITION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
				=> PARTITION 07: ALL QUERY
								 =========>
										 1.SELECT FROM TABLE
										 2.SELECT FROM VIEW
										 3.SELECT INTO
										 4.IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
										 5.INNER JOIN WITH GROUP BY CLAUSE
										 6.OUTER JOIN
										 7.CROSS JOIN
										 8.TOP CLAUSE WITH TIES
										 9.DISTINCT
										 10.COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
										 11.LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
										 12.OFFSET FETCH
										 13.UNION
										 14.EXCEPT INTERSECT
										 15.AGGREGATE FUNCTIONS
										 16.GROUP BY & HAVING CLAUSE
										 17.ROLLUP & CUBE OPERATOR
										 18.GROUPING SETS
										 19.SUB-QUERIES (INNER, CORRELATED)
										 20.EXISTS
										 21.CTE
										 22.MERGE
										 23.BUILT IN FUNCTION
										 24.CASE
										 25.IIF
										 26.COALESCE & ISNULL
										 27.WHILE
										 28.GROPING FUNCTION
										 29.RANKING FUNCTION
										 30.IF ELSE & PRINT
										 31.TRY CATCH
										 32.GOTO
*/



/* --------------------------------------PARTITION 01---------------------------------------
   --------------------------INSERT DATA USING INSERT INTO KEYWORD--------------------------		
*/

USE SSM
GO

INSERT INTO Categories(categoryName)VALUES('Groceries')
INSERT INTO Categories(categoryName)VALUES('Drinks')
INSERT INTO Categories(categoryName)VALUES('Vegetables')
INSERT INTO Categories(categoryName)VALUES('Meat')
INSERT INTO Categories(categoryName)VALUES('Herbs & Spices')
INSERT INTO Categories(categoryName)VALUES('Fruits')
INSERT INTO Categories(categoryName)VALUES('Detergent')

GO

SELECT * FROM Categories
GO

INSERT INTO City(cityID,cityName)VALUES(1,'Dhaka')
INSERT INTO City(cityID,cityName)VALUES(2,'Sylhet')
INSERT INTO City(cityID,cityName)VALUES(3,'Chittagong')
INSERT INTO City(cityID,cityName)VALUES(4,'Jeoshor')
INSERT INTO City(cityID,cityName)VALUES(5,'Khulna')
INSERT INTO City(cityID,cityName)VALUES(6,'Rajshahi')
INSERT INTO City(cityID,cityName)VALUES(7,'Rangpur')
INSERT INTO City(cityID,cityName)VALUES(8,'Barishal')
INSERT INTO City(cityID,cityName)VALUES(9,DEFAULT)

GO

SELECT * FROM City
GO

INSERT INTO Country(countryID,countryName)VALUES(1,'Bangladesh')
INSERT INTO Country(countryID,countryName)VALUES(2,'India')
INSERT INTO Country(countryID,countryName)VALUES(3,'Pakistan')
INSERT INTO Country(countryID,countryName)VALUES(4,'Indonesia')
INSERT INTO Country(countryID,countryName)VALUES(5,'China')
GO

SELECT * FROM Country
GO

INSERT INTO Gender(genderTitle)VALUES('Male'),('Female')
GO
SELECT * FROM Gender
GO

INSERT INTO DesignationEmp(designationName)VALUES('Manager'),('Cashier'),('Accounts'),('Sales Staff'),('Cleaner')
GO
SELECT * FROM DesignationEmp
GO

INSERT INTO StockingProducts(stockQuantity)VALUES(Default)
INSERT INTO StockingProducts(productID,stockQuantity)VALUES(2,100)
INSERT INTO StockingProducts(productID,stockQuantity)VALUES(3,100)
INSERT INTO StockingProducts(productID,stockQuantity)VALUES(4,100)
INSERT INTO StockingProducts(productID,stockQuantity)VALUES(5,100)
INSERT INTO StockingProducts(productID,stockQuantity)VALUES(6,100)
GO
SELECT * FROM StockingProducts
GO

INSERT INTO PaymentType(paymentMethod)VALUES('Cash')
INSERT INTO PaymentType(paymentMethod)VALUES('Card')
INSERT INTO PaymentType(paymentMethod)VALUES('Cash')
INSERT INTO PaymentType(paymentMethod)VALUES('Card')
INSERT INTO PaymentType(paymentMethod)VALUES('Cash')
INSERT INTO PaymentType(paymentMethod)VALUES('Card')
INSERT INTO PaymentType(paymentMethod)VALUES('Cash')
INSERT INTO PaymentType(paymentMethod)VALUES('Card')
INSERT INTO PaymentType(paymentMethod)VALUES('Cash')
INSERT INTO PaymentType(paymentMethod)VALUES('Card')

GO
SELECT * FROM PaymentType
GO

INSERT INTO Supplier(supplierCompanyName,ContactName,ContactNumber,[Address])
VALUES('PRAN','Md Abul Bashar','01223435345','Gazipur'),
	  ('UNILEVER BD','Md Abul Kashem','01323435345','Tongi'),
	  ('S.G.OIL','Sahadat Hosen','01423435345','Keraniganj'),
	  ('NOURISH POULTRY','Abul Kalam','01523435345','Narayenganj')
GO

SELECT * FROM Supplier
GO

INSERT INTO Customers(customerName,customerPhone,customerEmail,customerAddress,city,country)
VALUES('Md Aktaruzzaman','01778823882','ak@gmail.com','24/2 Police Fari',Default,Default),
	  ('Md Babul','01878823882','bul@gmail.com','Demra',Default,Default),
	  ('Konika Rahman','01678823882','knk@gmail.com','Khilgaon',Default,Default),
	  ('Aysha Siddika','01578823882','ays@gmail.com','Badda',Default,Default),
	  ('Chris Harson','01978823882','chris@gmail.com','Gulshan',Default,5),
	  ('Emraj Hosen','01478823882','em@gmail.com','Rampura',3,Default),
	  ('Sabbir Ahmed','01378823882','sa@gmail.com','Bashabo',Default,Default)
GO



INSERT INTO Products(productName,productDescript,categoryID,productPrice,productAvailability,supplierID,StockQuantity)
VALUES('Rice','Miniket 50KG',1,1199.00,1,2,50),
	  ('Coca-Cola','1.25L',2,100.00,1,2,100),
	  ('Potato','1 KG',3,40.00,1,4,100),
	  ('Chicken','PER/KG',4,250.00,1,4,100),
	  ('Beef','PER/KG',4,850.00,1,4,100),
	  ('Garlic Powder','250gm',5,150.00,1,1,150),
	  ('Ginger Powder','250gm',5,120.00,1,1,150),
	  ('Soap','Detol',7,65.00,1,2,200),
	  ('Surf Excel','1 KG',7,200.00,1,2,50),
	  ('Apple','1 KG',6,250.00,1,3,30),
	  ('Soyabean Oil','5L',1,1300.00,1,3,150),
	  ('Mango','1 KG',6,110.00,1,3,250),
	  ('Noodles','12 packs',1,250.00,1,2,50)
GO
SELECT * FROM Products
GO

INSERT INTO Employee(empFname,empLname,dob,empPhone,gender,empAddress,city,country,empEmail,empDesignation)
VALUES('Md Asad','Khan','1995-09-02','01923456432',1,'Baridhara',1,1,'ak@gmail.com',1),
	  ('Md Rubel','Hasan','1992-03-04','01223456432',1,'Paltan',1,1,'rk@gmail.com',2),
	  ('Eshita','Anam','1998-05-12','01423456432',2,'Banani',1,1,'esh@gmail.com',3),
	  ('Md Hasin','Abrar','1997-01-07','01523456432',1,'Halishar',3,1,'has@gmail.com',4),
	  ('Md Kabir','Ahmed','1999-09-02','01823456432',1,'Khilkhet',1,1,'ka@gmail.com',5)
GO
SElECT * FROM Employee
GO

INSERT INTO EmployeeInfo(empID,designationID,salary)VALUES(1,1,30000)
INSERT INTO EmployeeInfo(empID,designationID,salary)VALUES(2,2,25000)
INSERT INTO EmployeeInfo(empID,designationID,salary)VALUES(3,1,20000)
INSERT INTO EmployeeInfo(empID,designationID,salary)VALUES(4,1,17000)
INSERT INTO EmployeeInfo(empID,designationID,salary)VALUES(5,1,13000)
GO
SELECT * FROM EmployeeInfo
GO

INSERT INTO Payments(paymentDate,paymentMethod,customerID,paymentTotal,creditTotal)
VALUES('2023-02-01',1,1,2500.00,00.00),
	  ('2023-02-03',1,2,3500.00,00.00),
	  ('2023-02-01',2,3,1500.00,00.00),
	  ('2023-02-05',1,4,1100.00,00.00),
	  ('2023-02-07',2,5,1250.00,00.00),
	  ('2023-02-04',1,6,4000.00,00.00),
	  ('2023-02-05',2,7,6500.00,00.00)
	  
GO

SELECT * FROM Payments 
GO

/* --------------------------------------PARTITION 02---------------------------------------
   -------------------INSERT,UPDATE,DELETE DATA THROUGH STORED PROCEDURE--------------------------		
*/

---------INSERTING CUSTOMER WITH STORE PROCEDURE-------------------

EXEC sp_InsertToCustomer 'Waheda Islam','01822384483','Bansree',1,1,'wi@gmail.com'
EXEC sp_InsertToCustomer 'Jahidul Islam','01222384483','Nilkhet',1,1,'jh@gmail.com'
EXEC sp_InsertToCustomer 'Piyal','01622384483','Sahabag',1,1,'pl@gmail.com'
SELECT * FROM Customers
GO

---------INSERTING EMPLOYEE WITH STORE PROCEDURE USING OUTPUT PARAMETER-------------------

DECLARE @empID INT
EXEC sp_InsertToEmployee 'Md Hasibul','Islam','1998-09-09','01777233112','1','Mohakhali',4,1,3,'hi@gmail.com',@empID OUTPUT
PRINT 'The new Employee ID is : '+ str(@empID)
GO
SELECT * FROM Employee
GO

--UPDATE DESIGNATION TABLE WITH STORE PROCEDURE---------------------

EXEC sp_UpdateData 5,'Sales Staff' 
GO

SELECT * FROM DesignationEmp
GO

--DELETE FROM PRODUCTS TABLE WITH STORE PROCEDURE---------------------

EXEC sp_DeleteProduct 13
GO
SELECT * FROM Products

/* --------------------------------------PARTITION 03---------------------------------------
   -----------------------------INSERT DATA USING SEQUENCE VALUE--------------------------		
*/

INSERT INTO ExampleTableToDrop(dropingDescription,dropColumnOne) 
VALUES('Second Column to drop',(NEXT VALUE FOR SeqFirstOne))
GO
SELECT * FROM ExampleTableToDrop
GO

/* --------------------------------------PARTITION 04---------------------------------------
   ----------------------------INSERT,UPDATE,DELETE DATA THROUGH VIEW--------------------------		
*/

---INSERTION
SELECT * FROM vTotalPaymentToday
GO

INSERT INTO vTotalPaymentToday(paymentDate,paymentTotal)VALUES('2023-02-14',2200.00)
GO

---UPDATE
 UPDATE vTotalPaymentToday
 SET paymentTotal = 2700.00
 WHERE paymentID = 8
 GO
SELECT * FROM vTotalPaymentToday
GO
--DELETE
DELETE FROM vTotalPaymentToday
WHERE paymentID = 8
GO

SELECT * FROM vTotalPaymentToday
GO


/* --------------------------------------PARTITION 05---------------------------------------
   -------RETRIEVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)--------------
*/

---SCALER function to check Monthly Total Sales

SELECT dbo.funcGetCurrentSalesOfMonth() AS 'Total Sales'
GO


---Simple/Inline Table VALUED Function To Get Sales oF Specific Year & Month

SELECT * FROM dbo.funcSalesWithSpecificDate(2023,2)
GO

---Multi Table VALUED Function To Get Sales oF Specific Year & Month

SELECT * FROM dbo.funcSalesWithSpecificYM(2023,2)
GO

/* --------------------------------------PARTITION 06---------------------------------------
   -------TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)--------------
*/

----TESTING FOR/AFTER TRIGGER while Inserting or Updating Product Price or StockQuantity--------

SELECT * FROM Products
GO

UPDATE Products SET StockQuantity = 0
WHERE ProductID = 12
GO

----TESTING INSTEAD OF TRIGGER ON TABLE while preventing direct deletion of products with positive stock quantity--------

DELETE FROM Products
WHERE ProductID = 11
GO

SELECT * FROM Products
GO

--TESTING TRIGGER ON VIEW------------------

SELECT * FROM vTotalPaymentToday
GO

INSERT INTO vTotalPaymentToday(paymentDate,paymentTotal)VALUES('2023-02-10',2800.000)
GO

/* --------------------------------------PARTITION 07---------------------------------------
   ----------------------------------------ALL QUERY----------------------------------------
*/

---1.SELECT FROM TABLE to VIEW THE PRODUCTS

SELECT * FROM Products
GO

---2.SELECT FROM VIEW to View Payment Status Datewise

SELECT * FROM vTotalPaymentToday 
GO

---3.SELECT INTO Statement to save products in another table

SELECT * INTO ProductsResult
FROM Products
GO

---4.IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE

SELECT empFname,empDesignation,designationName,salary FROM Employee,EmployeeInfo,DesignationEmp
WHERE Employee.empID = EmployeeInfo.empID AND Employee.empID = DesignationEmp.designationID
ORDER BY salary DESC
GO

---5.INNER JOIN WITH GROUP BY CLAUSE

SELECT pt.paymentMethod,SUM(ALL p.paymentTotal) AS 'Total Payment By Payment Method' FROM Customers c
JOIN Payments p ON c.customerID = p.paymentID
JOIN PaymentType pt ON c.customerID = pt.pTypeID
GROUP BY pt.paymentMethod,p.paymentTotal
GO

---6.OUTER JOIN

SELECT * FROM Customers c
LEFT JOIN Payments p ON c.customerID = p.paymentID
RIGHT JOIN PaymentType pt ON c.customerID = pt.pTypeID
FULL JOIN City ct ON c.customerID = ct.cityID
GO

---7.CROSS JOIN

SELECT * FROM Payments
CROSS JOIN PaymentType
GO

---8.TOP CLAUSE WITH TIES

SELECT TOP 5 WITH TIES c.customerID,c.customerName,p.paymentTotal FROM Customers c
JOIN Payments p ON c.customerID = p.paymentID
ORDER BY p.paymentTotal
GO

SELECT DISTINCT c.categoryID,c.categoryName FROM Categories c
JOIN Products p ON c.categoryID = p.ProductID
ORDER BY c.categoryID
GO

---10.COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR

SELECT * FROM Employee
WHERE gender = 1 AND dob BETWEEN '1996-01-01' AND '1999-01-01'
AND NOT city = 3 OR city = 2
GO

---11.LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE

SELECT * FROM Employee
WHERE empLname LIKE '%i%' AND city NOT IN(1,2,3)
AND empDesignation IS NOT NULL
GO

---12.OFFSET FETCH

SELECT * FROM Customers
ORDER BY customerID
	OFFSET 3 ROWS
	FETCH NEXT 5 ROWS ONLY
GO

---13.UNION

SELECT empDesignation AS Designation FROM Employee
UNION 
SELECT salary FROM EmployeeInfo

---14.EXCEPT INTERSECT

SELECT * FROM Customers
EXCEPT 
SELECT * FROM Customers
WHERE country = 1
GO

---15.INTERSECT

SELECT * FROM Customers
INTERSECT
SELECT * FROM Customers
WHERE country = 5
GO

---16.AGGREGATE FUNCTIONS

SELECT COUNT(*) AS 'Total Payment Count',
	   SUM(ALL paymentTotal) AS 'Total SUM of Payment',
	   AVG(paymentTotal) AS 'AVG Payment',
	   MIN(paymentTotal) AS 'Min Payment',
	   MAX(paymentTotal) AS 'MAX Payment'
FROM Payments
GO

---17.GROUP BY & HAVING CLAUSE

SELECT paymentDate,paymentMethod,SUM(paymentTotal) AS 'Payment Greater than 2000' FROM Payments
GROUP BY paymentTotal,paymentDate,paymentMethod
HAVING paymentTotal > 2000 
GO

---18.ROLLUP & CUBE OPERATOR

--ROLLUP
SELECT emp.empFname,dg.designationName ,SUM(ei.salary) AS Salary FROM Employee emp
JOIN EmployeeInfo ei ON emp.empID = ei.empID
JOIN DesignationEmp dg ON emp.empID = dg.designationID
GROUP BY ROLLUP(emp.empFname,dg.designationName)
ORDER BY emp.empFname,dg.designationName
GO

--CUBE
SELECT emp.empFname,dg.designationName ,SUM(ei.salary) AS Salary FROM Employee emp
JOIN EmployeeInfo ei ON emp.empID = ei.empID
JOIN DesignationEmp dg ON emp.empID = dg.designationID
GROUP BY CUBE(emp.empFname,dg.designationName)
ORDER BY emp.empFname,dg.designationName
GO

---19.GROUPING SETS
SELECT emp.empFname,dg.designationName ,SUM(ei.salary) AS Salary FROM Employee emp
JOIN EmployeeInfo ei ON emp.empID = ei.empID
JOIN DesignationEmp dg ON emp.empID = dg.designationID
GROUP BY GROUPING SETS(emp.empFname,dg.designationName)
ORDER BY emp.empFname,dg.designationName
GO

---19.SUB-QUERIES (INNER, CORRELATED)
--INNER

SELECT ProductID,productName FROM Products
WHERE ProductID NOT IN (SELECT supplierID FROM Supplier)
GO

--CORRELATED

SELECT p.CustomerID,p.paymentID,p.paymentDate FROM Payments p
GROUP BY p.CustomerID,p.paymentID,p.paymentDate
HAVING p.paymentDate=(SELECT MIN(p.paymentDate) FROM Payments p2 WHERE p.CustomerID=p2.CustomerID)
GO

--20.EXISTS 

SELECT p.ProductID, p.ProductName, p.productPrice, p.StockQuantity, s.supplierCompanyName, s.ContactName, s.ContactNumber
FROM Products p
JOIN Supplier s ON p.SupplierID = s.SupplierID
WHERE EXISTS (
    SELECT 1
    FROM Supplier s1
    WHERE s1.SupplierID = p.SupplierID
);

--21.CTE WITH RECURSIVE

WITH CountNum AS(
				SELECT 1 AS n
				UNION ALL
				SELECT n+1 FROM CountNum WHERE n < 3
				)
SELECT * FROM CountNum
GO

--22.MERGE OPERATION---Updated From Products Table to Stocking Table

MERGE StockingProducts AS TARGET
USING Products AS SOURCE
ON TARGET.ProductID = SOURCE.ProductID
WHEN MATCHED AND TARGET.StockQuantity <> SOURCE.StockQuantity
	THEN
		UPDATE SET TARGET.ProductID = SOURCE.ProductID,TARGET.StockQuantity = SOURCE.StockQuantity
WHEN NOT MATCHED BY TARGET
	THEN 
		INSERT(ProductID,StockQuantity)VALUES(SOURCE.ProductID,SOURCE.StockQuantity);
GO

SELECT * FROM StockingProducts
Go

--23.BUILT IN FUNCTION(GETDATE,CAST,CONVERT,TRY_CONVERT,LEN,DATEDIFF,DATENAME)

SELECT GETDATE() AS TodaysDateTime

--CAST

SELECT CAST(100 AS MONEY) AS 'Conversion Data'

--CONVERT
SELECT empID, empFname,CONVERT(VARCHAR, dob, 103) AS FormattedBirthDate
FROM Employee;

--TRY_CONVERT--Return NULL
SELECT empID, empFname,TRY_CONVERT(float, 'dob', 1) AS FormattedBirthDate
FROM Employee;

--LEN
SELECT empID,empFname,Len(empFname) AS NameLength
FROM Employee;

--DATEDIFF--DIFFERENCE BETWEEN DAYS,YEAR,MONTH
SELECT DATEDIFF(YEAR, '1994-01-01', '2023-07-30') AS YEARDIFF
GO
SELECT DATEDIFF(MONTH, '1994-01-01', '2023-07-30') AS MONTHDIFF
GO
SELECT DATEDIFF(DAY, '1994-01-01', '2023-07-30') AS DAYDIFF
GO

--DATENAME--WEEKDAY,MONTH
SELECT DATENAME(WEEKDAY, GETDATE()) AS 'WEEKDAY'
GO
SELECT DATENAME(MONTH, GETDATE()) AS 'MONTH'
GO

--24.CASE

-- Query to categorize products based on stock quantity using the CASE function
SELECT ProductID, ProductName, productPrice, StockQuantity,
       CASE
           WHEN StockQuantity <= 10 THEN 'Low Stock'
           WHEN StockQuantity > 10 AND StockQuantity <= 20 THEN 'Medium Stock'
           ELSE 'High Stock'
       END AS StockCategory
FROM Products;
GO

--25.IIF

SElECT 
IIF ((salary > 15000), 'Increment NOT applicable','Increment Applicable') As 'Increment Issue',
empID,salary FROM EmployeeInfo 
GO

--26.COALESCE & ISNULL

SELECT COALESCE(emp.empFname,'Employees') AS EmployeeName,ISNULL(dg.designationName,'Designation') AS Designation,
SUM(ei.salary) AS Salary FROM Employee emp
JOIN EmployeeInfo ei ON emp.empID = ei.empID
JOIN DesignationEmp dg ON emp.empID = dg.designationID
GROUP BY GROUPING SETS(emp.empFname,dg.designationName)
ORDER BY emp.empFname,dg.designationName
GO

--27.WHILE

DECLARE @val INT
SET @val=10

WHILE @val>0
	BEGIN
		IF(@val=5)
		BREAK
		PRINT @val
		SET @val=@val-1
	END
GO

--28.GROUPING FUNCTION

SELECT productPrice, StockQuantity,
       CASE
           WHEN GROUPING(StockQuantity) <= 10 THEN 'Low Stock'
           WHEN GROUPING(StockQuantity) > 10 AND StockQuantity <= 20 THEN 'Medium Stock'
           ELSE 'High Stock'
       END AS StockCategory
FROM Products
GROUP BY StockQuantity,productPrice
GO

--29.RANKING FUNCTION

--ROW_NUMBER
SELECT productId,productName,
ROW_NUMBER() OVER (ORDER BY productName) AS Row_Number
FROM Products ORDER BY productName
GO
--RANK & DENSE RANK
SELECT empID,empFname,gender, 
RANK() OVER(ORDER BY gender) AS Rank,
DENSE_RANK() OVER (ORDER BY gender) AS Dense_Rank
FROM employee
GO

SELECT empID,empFname,gender, 
NTILE(4) OVER(ORDER BY gender) AS Ntile
FROM employee
GO

--30.IF ELSE

DECLARE @age INT
SET @age=22;

IF(@age>30 AND @age<60)
	PRINT 'You are middle aged!!'
ELSE IF(@age<30 AND @age>18)
	BEGIN
		PRINT 'You are Young person!!'
	END
ELSE
	PRINT 'You are teen!!'
GO

--31.TRY CATCH

BEGIN TRY
	SELECT 10/0
END TRY
BEGIN CATCH
	BEGIN
		PRINT 'Incorrect.Please Try Again!'
		SELECT 
		ERROR_NUMBER() AS [Error Message],
		ERROR_LINE() AS ErrorLine
	END
END CATCH
GO

---32.GOTO

DECLARE @totalMarks INT
SET @totalMarks=61
IF @totalMarks>=50
	GOTO PASS
IF @totalMarks <50
	GOTO Fail
PASS:
		PRINT ' Congratulations'
		PRINT ' You pass the examination'
		RETURN
Fail:
	
		PRINT ' You failed!!'
		PRINT ' Try to better next time!!'
		RETURN
GO
---------------------------------------------------------END OF THE DML PARTITION-------------------------------------------------------------------
----------------------------------------------------------------THANK YOU--------------------------------------------------------------------------