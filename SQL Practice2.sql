--	Return the BusinessEntityID, NationalIDNumber, LoginID, JobTitle, HireDate, BirthDate, VacationHours, SickLeaveHours
--	of the employees.
--	HINT:	HumanResources.Employee

SELECT	BusinessEntityID
		,NationalIDNumber
		,LoginID
		,JobTitle
		,HireDate
		,BirthDate
		,VacationHours
		,SickLeaveHours
FROM HumanResources.Employee;

--	Create a report showing the FromCurrencyCode, ToCurrencyCode, AverageRate, EndOfDayRate, CurrencyRateDate of the 
--	currency set that had the lowest EndOfDay rate
--	HINT:	Sales.CurrencyRate
		
SELECT FromCurrencyCode
	, ToCurrencyCode
	, AverageRate
	, EndOfDayRate
	, CurrencyRateDate
FROM SALES.CurrencyRate
ORDER BY EndOfDayRate ASC;

--	Create a report showing the StateProvinceID, TaxRateName and TaxRate of the top 3 StateProvinces 
--	with the lowest tax rate
--	HINT:	Sales.SalesTaxRate
--	Validation:	Your query should return exactly 15 rows.
		
SELECT TOP 3 WITH TIES 
	StateProvinceID
	, Name
	, TaxRate
FROM Sales.SalesTaxRate
ORDER BY TaxRate ASC;

--	Create a report showing the SalesReasonID, SalesReason, ReasonType and ModifiedDate
--	of all records in the Sales.SalesReasonTable
		
SELECT SalesReasonID
	, ReasonType
	, ModifiedDate
FROM Sales.SalesReason;

--	Create a report showing the BusinessEntityID, NationalIDNumber (Call it SSN), LoginID, JobTitle, BirthDate (Call it DateOfBirth),
--	MaritalStatus, Gender, HireDate, VacationHours and SickLeaveHours of all employees.
--	Sort your report by the VacationHours (from highest to lowest), followed by the SickLeaveHours (from highest to lowest).
--	If two or more employees have the same amount of VacationHours and SickLeaveHours, then the report should be sorted by the BusinessEntityID (lowest to highest)
--	HINT:	HumanResources.Employee
		
SELECT BusinessEntityID
	, NationalIDNumber AS SSN
	, LoginID
	, JobTitle
	, BirthDate AS DateOfBirth
	, MaritalStatus
	, Gender
	, HireDate
	, VacationHours
	, SickLeaveHours
FROM HumanResources.Employee
ORDER BY VacationHours DESC, SickLeaveHours DESC, BusinessEntityID ASC;

--	All the cards stored in the Sales.CreditCard table have an Expiry Month and Expiry Year. 
--	Create a report to show the CreditCardID, CardType, CardNumber, ExpiryMonth, ExpiryYear
--	of all cards that have the most recent expiry year and month.
--	Validation:	Your query should return exactly 375 rows.

SELECT CreditCardID
	, CardType
	, CardNumber
	, ExpMonth
	, ExpYear
FROM Sales.CreditCard
ORDER BY ExpYear DESC, ExpMonth DESC;

-- Write a query to show the products with the list price of 3578.27 dollars. 
--	Sort your result by the ProductID from the highest product id to the lowest product id
--	HINT:	Production.Product.

SELECT *
FROM Production.Product
WHERE ListPrice = 3578.27
ORDER BY ProductID DESC;

--	Return all products with a list price of 1364.50 dollars or more.
--	Sort your result by the Weight from the lowest value to the highest value
--	HINT:	Production.Product		

SELECT *
FROM Production.Product
WHERE ListPrice = 1364.50
ORDER BY [Weight];

--	Return all products with a list price of 1364.50 dollars or more and also has a StandardCost of 868.6342 dollars or lesser
--	Sort your result by the color in ascending order
--	HINT:	Production.Product		

SELECT *
FROM Production.Product
WHERE ListPrice >= 1364.50
AND StandardCost <= 868.6342
ORDER BY Color;

--	Return all Silver colored products with a list price of 1364.50 dollars or more.
--	Sort your result by the StandardCost from the highest value to the lowest value
--	HINT:	Production.Product		

SELECT *
FROM Production.Product
WHERE ListPrice >= 1364.50
AND Color = 'Silver'
ORDER BY StandardCost DESC;

--	Return all products that have the following colors: Grey, Multi, Silver/Black
--	HINT:	Production.Product

SELECT *
FROM Production.Product
WHERE Color IN ('grey', 'multi', 'silver/black');

--	Return all products that have the following colors: Black, Grey, Multi, Silver/Black
--	and has a name that contains the word "Mountain"
--	HINT:	Production.Product

SELECT *
FROM Production.Product
WHERE Color IN ('black', 'grey', 'multi', 'silver/black')
AND Name LIKE '%mountain%';

--  Please provide all salaried employees who were hired in 2008 and 2009
--	Sort your result by their job titles in ascending order.
--	HINT: Humanresources.Employee 

SELECT*
FROM HumanResources.Employee
WHERE HireDate BETWEEN 'January 1 2008' AND 'December 31 2009'
ORDER BY JobTitle;

--	Return a list of employees who have the JobTitle Network Administrator and  were hired in 2008.
--	Sort your result by the HireDate from the most recently hired employee to the least recently hired.
--	HINT: HumanResources.Employee

SELECT*
FROM HumanResources.Employee
WHERE JobTitle = 'Network Administrator'
AND HireDate LIKE '2008%'
ORDER BY HireDate DESC;
			
-- 	Please provide a list of store names serviced  by salespersonIDs 277,280 and 286
--	HINT : Sales.Store

SELECT *
FROM Sales.Store
WHERE SalesPersonID in ('277', '280', '286');
						
--  Please provide all Products from the product table whose name starts with the word "Mountain"
--	and the color is unknown
--	HINT : Production.product

SELECT *
FROM Production.Product
WHERE Name like 'Mountain%'
AND Color is Null;

--  Please provide all Products from the product table whose name contains the word "Mountain-" and the color is either Silver or Black
--	HINT : Production.product
		
SELECT *
FROM Production.Product
WHERE Name like '%Mountain%'
AND Color IN ('silver', 'black');		

--	Please provide a list of orders that do not have a sales person ID associated with them
--	HINT : Sales.SalesOrderHeader 

SELECT *
FROM sales.SalesOrderHeader
WHERE SalesPersonID IS Null;

--	Please provide a list of orders that have a sales person ID associated with them
--	and has a total due between 35,000 dollars and 185,000 dollars
--	Sort your result by the total due from the highest amount to the lowest amount
--	HINT : Sales.SalesOrderHeader 

SELECT *
FROM sales.SalesOrderHeader
WHERE SalesPersonID IS NOT Null 
AND TotalDue BETWEEN 35000 AND 185000;

--	Write a query to show the BusinessEntityID, NationalIDNumber, LoginID, JobTitle, BirthDate, HireDate
--	and TotalPTOHours of all employees. TotalPTOHours is a derived column that is the sum of the 
--	VacationHours and the SickLeaveHours.
--	HINT:	HumanResources.Employee.

SELECT BusinessEntityID
	, NationalIDNumber
	, LoginID
	, JobTitle
	, BirthDate
	, HireDate
	, VacationHours
	, SickLeaveHours
	, VacationHours + SickLeaveHours AS TotalPTOHours
FROM HumanResources.Employee;

--	Please return the SalesOrderID, SalesOrderNumber, OrderDate, ShipDate, CustomerID, SubTotal, TaxAmt, Freight and TotalDue
--	for the order with the highest shipping cost in 2011.
--	HINT:	Sales.SalesOrderHeader
		
SELECT SalesOrderID
	, SalesOrderNumber
	, OrderDate
	, ShipDate
	, CustomerID
	, SubTotal
	, TaxAmt
	, Freight
	, TotalDue
FROM Sales.SalesOrderHeader 
WHERE ShipDate < 'January 1 2012' 
ORDER BY TotalDue DESC;


































