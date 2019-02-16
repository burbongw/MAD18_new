DROP SCHEMA IF EXISTS OLAP
GO

CREATE SCHEMA OLAP
GO

CREATE VIEW OLAP.DATEDIMENSION AS
(	SELECT
	   [Date]
      ,[Day Number]
      ,[Day]
      ,[Month]
      ,[Short Month]
      ,[Calendar Month Number]
      ,[Calendar Month Label]
      ,[Calendar Year]
      ,[Calendar Year Label]
      ,[Fiscal Month Number]
      ,[Fiscal Month Label]
      ,[Fiscal Year]
      ,[Fiscal Year Label]
      ,[ISO Week Number]
	FROM [WideWorldImportersDW].[Dimension].[Date]
)
go

CREATE VIEW OLAP.CITY AS
(
SELECT [City Key]
      ,[City]
      ,[State Province]
      ,[Country]
      ,[Continent]
      ,[Sales Territory]
      ,[Region]
      ,[Subregion]
      ,[Location]
      ,[Latest Recorded Population]
      ,[Valid From]
      ,[Valid To]
  FROM [WideWorldImportersDW].[Dimension].[City]
)
GO

CREATE VIEW OLAP.FACT_ORDER AS
(
SELECT [Order Key]
      ,[City Key]
      ,[Customer Key]
      ,[Stock Item Key]
      ,[Order Date Key]
      ,[Description]
      ,[Package]
      ,[Quantity]
      ,[Unit Price]
      ,[Tax Rate]
      ,[Total Excluding Tax]
      ,[Tax Amount]
      ,[Total Including Tax]
  FROM [WideWorldImportersDW].[Fact].[Order]
)
GO

CREATE VIEW OLAP.CUSTOMER AS
(
SELECT [Customer Key]
      ,[Customer]
      ,[Bill To Customer]
      ,[Category]
      ,[Buying Group]
      ,[Primary Contact]
      ,[Postal Code]
      ,[Valid From]
      ,[Valid To]
  FROM [WideWorldImportersDW].[Dimension].[Customer]
)
GO

CREATE VIEW OLAP.Stock_Item AS
(
	SELECT 
	   [Stock Item Key]
      ,[Stock Item]
      ,[Color]
      ,[Selling Package]
      ,[Buying Package]
      ,[Brand]
      ,[Size]
      ,[Lead Time Days]
      ,[Quantity Per Outer]
      ,[Is Chiller Stock]
      ,[Barcode]
      ,[Tax Rate]
      ,[Unit Price]
      ,[Recommended Retail Price]
      ,[Typical Weight Per Unit]
      ,[Valid From]
      ,[Valid To]
	FROM [WideWorldImportersDW].[Dimension].[Stock Item]
)
go

CREATE VIEW OLAP.Fact_Sale AS
(
SELECT 
	   [Sale Key]
      ,[City Key]
      ,[Customer Key]
      ,[Bill To Customer Key]
      ,[Stock Item Key]
      ,[Invoice Date Key]
      ,[Delivery Date Key]
      ,[WWI Invoice ID]
      ,[Description]
      ,[Package]
      ,[Quantity]
      ,[Unit Price]
      ,[Tax Rate]
      ,[Total Excluding Tax]
      ,[Tax Amount]
      ,[Profit]
      ,[Total Including Tax]
      ,[Total Dry Items]
      ,[Total Chiller Items]
  FROM [WideWorldImportersDW].[Fact].[Sale]
)