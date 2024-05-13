use pizza;
SELECT SUM(total_price) AS Total_Revenue
FROM [dbo].[pizza_sales excel file]

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_Order_Value 
FROM [dbo].[pizza_sales excel file]

SELECT SUM(quantity) AS Total_Pizza_Sold 
FROM [dbo].[pizza_sales excel file]

SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM [dbo].[pizza_sales excel file]

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_Per_Order
FROM [dbo].[pizza_sales excel file]

SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM [dbo].[pizza_sales excel file]
GROUP BY DATENAME(DW, order_date);

SELECT DATEPART(HOUR, order_time) as Order_Hours, COUNT(DISTINCT order_id) as Total_Orders
FROM [dbo].[pizza_sales excel file]
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [dbo].[pizza_sales excel file]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales excel file]
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [dbo].[pizza_sales excel file]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales excel file]
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [dbo].[pizza_sales excel file]
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [dbo].[pizza_sales excel file]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [dbo].[pizza_sales excel file]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;




