--Cleansing Of The dbo.DimCustomer Table--

/*
In this SQL script the dbo.DimCustomer table is being cleansed in order to visualize the 
data it contains in the Power BI application. The table will contain important data about
the customer and later will be used to help filter sales data based on customers in Power
BI. In additon, the dbo.DimCustomer table will be joined with the dbo.DimGeography in order
to obtain information about the location of the city where the customer lives.
*/

--Calling the correct database to use the specific tables needed for the analysis.
USE AdventureWorksDW2019;

--Start of the table cleansing. 
SELECT
	c.CustomerKey,
	c.FirstName,
	c.LastName,
	CONCAT(c.FirstName, ' ', c.LastName) AS 'FullName', --Creation of a column that combines the first name and last name.
	CASE --Creation of an condition based the sex of the customer. 
		WHEN c.Gender = 'M' THEN 'Male'
		WHEN c.Gender = 'F' THEN 'Female'
	END AS Gender,
	c.DateFirstPurchase,
	g.City
FROM dbo.DimCustomer AS c
LEFT JOIN dbo.DimGeography AS g ON c.GeographyKey = g.GeographyKey --The dbo.DimCustomer table will be joined with the dbo.DimGeography table. 
Order By c.CustomerKey;
