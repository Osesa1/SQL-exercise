-- Please run your queries against the Adventureworks database
-- Please ensure that your query runs and you validated the result


/*
Write a SQL query that will generate that set that display 
a list of first name, last name and  phone numbers from the person and phone number table.
All first name and last name must have a phone number
*/

SELECT FirstName, LastName, PhoneNumber
FROM Person.Person as pp
inner join Person.PersonPhone as ppn
on pp.BusinessEntityID = ppn.BusinessEntityID;

/*
Using your result from question 1, add the email address, remember that all the names 
must have email addresses. Then create a derived columns called Full name that will 
concatenate, First Name Last name. 
*/

SELECT FirstName, LastName, PhoneNumber, 
	EmailAddress, CONCAT(FirstName,' ',LastName) as fullname
FROM Person.Person as pp
inner join Person.PersonPhone as ppn
on pp.BusinessEntityID = ppn.BusinessEntityID
INNER JOIN Person.EmailAddress AS EA
ON EA.BusinessEntityID = PP.BusinessEntityID;


/*
Write a SQL query to generate all the list of phone numbers where the phone number type is 
"Home" 
*/

select DISTINCT PhoneNumber, PNT.PhoneNumberTypeID, PNT.Name
FROM Person.PersonPhone AS PP
INNER JOIN Person.PhoneNumberType AS PNT
ON PNT.PhoneNumberTypeID = PP.PhoneNumberTypeID
WHERE PNT.PhoneNumberTypeID = 2;

/*
Your company is about a make a business decision they needs to know what sales territory 
has hit their target based on the last year sales and the salesYTD (year to date). They
want you to Write a query to retrieve relievant information(Please pick columns that you will like to see in a normal reporting)
from the SalesTerritory table  and then add a derived column called 'Target' that will display the following:
If the territory's SalesLastYear exceeds salesYTD , display 'Not met'
else display 'Met'.
*/

SELECT [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear],
	  case
	  when SalesLastYear > SalesYTD then 'Not Met'
	  else 'Met'
	  end as 'Target'
  FROM [Sales].[SalesTerritory];

/*
Write a query to display the 
Write a query to retrieve the MONTH of the birth date of each employeer
*/

SELECT birthdate, 
	MONTH(BirthDate)	as EmployeeBirthMonth
FROM HumanResources.Employee;

/*
Your company is in thep process of rewarding it customers and they have asked you to generate
a query that will display the customer account number, the customer id, from the customer table
and the order date, due date and ship date from the salesorderheader table.
	1. The want you you to only return the date from the order date, due date and ship date 
	2. They want you to write a derived column called DueDateExtended that will add 3 months to the due date
	3. They want you to write a derived column called ShipDateExtended that will add 7 days to the ship date
*/

SELECT C.CustomerID
      ,C.AccountNumber
	  ,CAST(SOH.OrderDate AS Date) AS OrderDate
      ,CAST(SOH.DueDate AS Date) AS DueDate
      ,CAST(SOH.ShipDate AS Date) AS ShipDate
	  ,DATEADD(Month,3,CAST(SOH.DueDate AS DATE)) AS  DueDateExtended
	  ,DATEADD(Day,7,CAST(SOH.ShipDate AS Date)) AS  ShipDateExtended
  FROM Sales.Customer AS C
LEFT JOIN Sales.SalesOrderHeader	AS SOH
ON C.CustomerID = SOH.CustomerID;

/*
The front end developer are finding it hard to using your report that you created in question 9.
They have asked that you create add a derived column called FrontEndColumn that will convert
all the first letter of the account number to lower case.
*/

SELECT C.CustomerID
      ,C.AccountNumber
	  ,CAST(SOH.OrderDate AS Date) AS OrderDate
      ,CAST(SOH.DueDate AS Date) AS DueDate
      ,CAST(SOH.ShipDate AS Date) AS ShipDate
	  ,DATEADD(Month,3,CAST(SOH.DueDate AS DATE)) AS  DueDateExtended
	  ,DATEADD(Day,7,CAST(SOH.ShipDate AS Date)) AS	ShipDateExtended
	  , lower(SUBSTRING('AW00029825',1,1)) AS FirstLettertoLower
	  ,SUBSTRING('AW00029825',2,LEN('AW00029825')) AS RestOfLetter
	  ,CONCAT(lower(SUBSTRING('AW00029825',1,1)),SUBSTRING('AW00029825',2,LEN('AW00029825'))) asFrontEndColumn
  FROM Sales.Customer AS C
LEFT JOIN Sales.SalesOrderHeader	AS SOH
ON C.CustomerID = SOH.CustomerID;
