--Cleansing dbo.DimProduct Table--

/*
In this SQL script the information that is being cleansed deals with products. With 
this information loaded into Power BI, the sales data can be filtered based upon 
products. In addition, three tables will be joined during the cleansing process.The 
three tables are dbp.DimProduct Table, dbo.DimProductSubcategory table, and the 
dbo.DimProductCategory table. The joining of the tables will allow for the extraction of
information about categories and subcategories that the products are grouped in. This will
allow for power filteration parameters in Power BI.
*/

--Call the correct database in order to utilize tables for analysis.
USE AdventureWorksDW2019;

--Start of the query for cleansing the dbo.DimProduct Table.
SELECT
	p.ProductKey,
	p.EnglishProductName AS 'Product Name',
	ps.EnglishProductSubcategoryName AS 'Sub Category', --Joined in from subcategory table
	pc.EnglishProductCategoryName AS 'Product Category', --Joined in from category table
	p.Color AS 'Product Color',
	p.Size AS 'Product Size',
	p.ProductLine AS 'Product Line',
	p.ModelName AS 'Product Model Name',
	p.EnglishDescription AS 'Product Description',
	ISNULL (p.Status, 'Outdated') AS 'Product Status' -- A condition that changes null values to Outdated in the product status column. 
FROM dbo.DimProduct AS p
LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS pc ON pc.ProductCategoryKey = ps.ProductCategoryKey
ORDER BY p.ProductKey;
