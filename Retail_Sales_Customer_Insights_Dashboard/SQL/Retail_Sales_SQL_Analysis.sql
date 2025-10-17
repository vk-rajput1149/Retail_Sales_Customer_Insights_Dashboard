CREATE TABLE superstore_sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales NUMERIC(10,2),
    Year INT,
    Month VARCHAR(20)
);

--Importing file 

COPY superstore_sales
FROM 'E:\Retail_Sales_Customer_Insights_Dashboard\SQL\Superstore_Sales_Cleaned.csv'
DELIMITER ','
CSV HEADER;


SELECT * FROM superstore_sales;



------------------------------------------------------------
-- PROJECT: Retail Sales & Customer Insights Dashboard
-- TOOL: PostgreSQL
-- AUTHOR: Aadi Chauhan
-- OBJECTIVE: Perform data exploration and KPI analysis
-- DATASET: Superstore_Sales_Cleaned.csv

------------------------------------------------------------
-- 1️⃣ CHECK BASIC DATA STRUCTURE

-- View first 10 rows to confirm data import
SELECT * FROM superstore_sales LIMIT 10;

-- Check total number of records
SELECT COUNT(*) AS total_rows FROM superstore_sales;

-- Check for missing values (NULLs)
SELECT 
    COUNT(*) FILTER (WHERE Sales IS NULL) AS missing_sales,
    COUNT(*) FILTER (WHERE Order_ID IS NULL) AS missing_orderid,
    COUNT(*) FILTER (WHERE Customer_ID IS NULL) AS missing_customerid
FROM superstore_sales;

------------------------------------------------------------
-- 2️⃣ BASIC KPIs
------------------------------------------------------------

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM superstore_sales;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_sales;

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM superstore_sales;

-- Average Sales per Order
SELECT SUM(Sales) / COUNT(DISTINCT Order_ID) AS Avg_Sales_Per_Order
FROM superstore_sales;

-- Average Sales per Customer
SELECT ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS Sales_Per_Customer
FROM superstore_sales;

------------------------------------------------------------
-- 3️⃣ SALES ANALYSIS BY DIMENSIONS
------------------------------------------------------------

-- Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Sales by Segment
SELECT Segment, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Sales by Sub-Category
SELECT Sub_Category, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

------------------------------------------------------------
-- 4️⃣ TIME SERIES ANALYSIS
------------------------------------------------------------

-- Yearly Sales Trend
SELECT Year, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Year
ORDER BY Year;

-- Monthly Sales Trend (Aggregated over all years)
SELECT Month, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Month
ORDER BY Month;

------------------------------------------------------------
-- 5️⃣ TOP PERFORMERS
------------------------------------------------------------

-- Top 10 Customers by Sales
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Cities by Sales
SELECT City, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

------------------------------------------------------------
-- 6️⃣ ADDITIONAL INSIGHTS
------------------------------------------------------------

-- Average Order Value per Region
SELECT Region, SUM(Sales) / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM superstore_sales
GROUP BY Region
ORDER BY Avg_Order_Value DESC;

-- Monthly Trend by Year (Combined)
SELECT Year, Month, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Sales Contribution % by Category
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    (SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER ()) AS Percentage_Contribution
FROM superstore_sales
GROUP BY Category
ORDER BY Percentage_Contribution DESC;

------------------------------------------------------------
-- ✅ END OF ANALYSIS
-- This SQL analysis provides backend validation and KPIs
-- that align with the Power BI dashboard metrics.
------------------------------------------------------------