--Clensing Of The dbo.FactInternetSales Table--

/*
In this SQL script the information that is being extracted pertains to actual internet sales 
numbers. The only numbers that are of importance is the present and the previous two years. This 
data will portray the actual sales values and how these values change when filters are applied 
in Power BI.
*/

--Start of the query for clensing the dbo.FactInternetSales Table. 
SELECT
	ProductKey,
	OrderDateKey,
	DueDateKey,
	ShipDateKey,
	CustomerKey,
	SalesOrderNumber,
	SalesAmount
FROM dbo.FactInternetSales
WHERE LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) - 2 --Ensures that the data from the previous two years is extracted as well. 
ORDER BY OrderDateKey;