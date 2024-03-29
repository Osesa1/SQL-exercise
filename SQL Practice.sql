-- Please run your queries against the Adventureworks database
-- Please ensure that your query runs and you validated the result

/* 
Write a SQL query to generate datasets that will return
 the average total due of all Customers from the SalesOrderHeader
*/

SELECT CustomerID, AVG(TotalDue)	as AVGTotal
FROM Sales.SalesOrderHeader
group by CustomerID;

/*
Write a SQL query that will generate datasets that display's the first name, last name 
and a derived column called FirstThree that will display the first three characters of 
the first name from the person table.
*/

SELECT FirstName, LastName,
	LEFT(FirstName, 3)	AS FirstThree
FROM Person.Person;

/*
Write a SQL query that will generate datasets that display's the [JobTitle],[BirthDate],[HireDate].
Write two derived columns
1. derived column named HireDateMod that will replace the "-" of the hire date with ":" 
2. Write another derived column name statusCheck to display the following
	If the marital status is "S" the return "single" and append their vacation Hours
	if the marital status is "M" then return "Married" from the Employee
*/

SELECT JobTitle, BirthDate, hiredate,
		REPLACE(HireDate, '-',':')	as HireDateMod,
	CASE MaritalStatus
	WHEN 's' THEN 'single'
	WHEN 'M' THEN 'married'
	END AS StatusCheck
FROM HumanResources.Employee;

/* 
Your anager will like you to generate datasets for monthly report against
the Customer table to return the count of the StoreID's that are less than 2
*/ 

SELECT CustomerID, COUNT(StoreID) as StoreIDCount
FROM sales.Customer
GROUP BY StoreID, CustomerID
HAVING COUNT(StoreID)	< 2;

/*
Write a SQL query that will display the first name and last name from the Person table
*/

SELECT FirstName, LastName
FROM Person.Person;

/*
write a sql query that will display the first name and last name then write a 
derived column called full name. this derived column  should hold the combination 
of the last name and first name from the person table
*/ 

SELECT firstname, lastname,
	CONCAT(FirstName, ' ', LastName)	as FullName
FROM Person.Person;

/*
Using your datasets from question 6, your manager will like you to have a delimiter on the full name
the delimiter should be a dash so meaning every full name should have a dash (-) in between the first ane
and last name.
*/

SELECT firstname, lastname,
	CONCAT(FirstName, '-', LastName)	as FullName
FROM Person.Person;

/*
Write a query against SalesOrderHeader to generate dataset that will return
the three ship countries with the highest average freight 
*/

SELECT top (3) ShipToAddressID, AVG(Freight)	as avgFreight
FROM Sales.SalesOrderHeader
GROUP BY ShipToAddressID
order by avgFreight desc;

/*
Your company is about to send information to employees who may be losing their vacation hours due
to the end of the year cut of vacation hours number. You have been task to generate a dataset against 
the employees table to display the job title, marital status, gender, vacation hours and sick leave
*/ 

SELECT JobTitle, MaritalStatus, Gender, VacationHours, SickLeaveHours
FROM HumanResources.Employee;

/*
Using your dataset from Question 9, the business will like you to add a derived column called 
VacHoursCheck this column should have the below information
	1. If the vacation hours is grater than 70 return "Send Email"
	2. If the vacation hours is less than or equal to 70 return "Safe"
*/

SELECT JobTitle, MaritalStatus, Gender, VacationHours, SickLeaveHours,
	CASE
	WHEN VacationHours > 70 THEN 'Send Email'
	WHEN VacationHours <= 70 THEN 'Safe'
	END AS VacHoursCheck
FROM HumanResources.Employee;

/*
Using your dataset from question 10, the business will like you to add another derived column called
MaxReached?. This column should have the following information.
	1. If the sum of the vacation hours and the sick leave hours is grater than 150 then return "Yes"
	2. If the sum of the vacation hours and the sick leave hours is less than 150 but grater than
		70 return "No"
Anything else should return NULL  
*/

SELECT JobTitle, MaritalStatus, Gender, VacationHours, SickLeaveHours,
	CASE
		WHEN VacationHours > 70 THEN 'Send Email'
		WHEN VacationHours <= 70 THEN 'Safe'
	END AS VacHoursCheck,
	CASE 
		WHEN VacationHours + SickLeaveHours > 150 THEN 'yes'
		WHEN VacationHours + SickLeaveHours < 150 OR VacationHours + SickLeaveHours  > 70  THEN 'no'
		ELSE null
	END AS [MaxReached?]
FROM HumanResources.Employee;

/*
Write a query against the employee's table to generate a dataset that will display the hire date, 
birth date,and job title. Also, include a derived column called First4 that will return the first 
four values of the birth date.
*/

SELECT HireDate, BirthDate, JobTitle,
	LEFT(BirthDate, 4)	as First4
FROM HumanResources.Employee;

/*
Using your dataset from question 12, add a derived column called lastTwo that will return the last two values from the
hires data
*/

SELECT HireDate, BirthDate, JobTitle,
	LEFT(BirthDate, 4)	as First4,
	RIGHT(HireDate,2)	as LastTwo
FROM HumanResources.Employee;

/*
Write a query against the product table that will display the product name, 
the product name and color.
*/

SELECT Name, Color, ProductNumber
FROM Production.Product;

/*
Your manager just reviewed your report on question 14 and he is concerned on the NULL values he/she saw on the
color column. You have been task to write a derived column called AddColorInfo. The AddColorInfo column should
replace all the NULL's on the color column to read "unknown" so it will be easy to present to the business
*/

SELECT Name, Color, ProductNumber,
	CASE
		WHEN COLOR IS NULL THEN 'unknown'
		ELSE Color
	END AS AddColorInfo
FROM Production.Product;

/*
Write a query against the SalesOrderDetail to generate dataset that will return product ID's that have  
order quantity grater than 2
*/

SELECT ProductID, OrderQty
FROM Sales.SalesOrderDetail
WHERE OrderQty > 2
order by ProductID;

/*
Write a SQL query against the customer table to generate dataset that will display the store ID,
Territory ID and account number. Add a derived column called SubNumber that will return every
values after the AW on the account number
*/ 

SELECT StoreID, TerritoryID, AccountNumber,
	right(AccountNumber, 8) as SubNumber
FROM Sales.Customer;
