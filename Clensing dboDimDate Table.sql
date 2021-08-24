--Clensing The dbo.DIMDATE Table--

/*
In this SQL script the information that is being extracted deals calendar information
like month, date , year, etc... The information in this clensed table will filter the 
sales data in Power BI by month and year allowing one to see how the sales data changes
over time.
*/

SELECT 
	DateKey,
	FullDateAlternateKey AS 'Date',
	EnglishDayNameofWeek AS 'Day',
	WeekNumberofYear AS 'WeekNum',
	EnglishMonthName AS 'Month',
	LEFT(EnglishMonthName, 3) AS 'MonthShort', --Creation of a column that contains shorten month names. 
	MonthNumberofYear AS 'MonthNum',
	CalendarQuarter AS 'Quarter',
	CalendarYear As 'Year'
FROM
	dbo.DIMDATE
WHERE
	CalendarYear >= 2019
ORDER BY
	Date;