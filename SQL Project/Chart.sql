use pizza
--Daily Trend
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM [dbo].[pizza_sales excel file]
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date);

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_Orders
FROM [dbo].[pizza_sales excel file]
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

--Percentage of Sales by Pizza Category
SELECT pizza_category, sum(total_price) AS Total_Sales, sum(total_price) * 100 / (SELECT sum(total_price)  FROM [dbo].[pizza_sales excel file]) AS Percentage_Sales
FROM [dbo].[pizza_sales excel file]
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

--Percentage Pizza Sales by Pizza Size
SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(sum(total_price) * 100 /
(SELECT sum(total_price) FROM [dbo].[pizza_sales excel file]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales excel file]
WHERE DATEPART(QUARTER, order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC;

--TOP 5 Pizza Sales
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM [dbo].[pizza_sales excel file]
WHERE MONTH(order_date) = 8
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;