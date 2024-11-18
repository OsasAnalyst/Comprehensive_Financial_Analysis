SELECT * FROM portfolio.retail_sales_worked_data;
 

-- Total Sales Amount by Product Category

SELECT Product_Category, SUM(Total_Amount) AS Total_Sales_Amount
FROM Retail_sales_Worked_data
GROUP BY Product_Category
ORDER BY Total_Sales_Amount DESC;



-- Total Sales Amount by Quarter

SELECT Quarter, SUM(Total_Amount) AS Total_Sales_Amount
FROM Retail_sales_Worked_data
GROUP BY Quarter
ORDER BY Quarter;



-- Average Price per Unit by Product Category

SELECT Product_Category, AVG(Price_per_Unit) AS Avg_Price_Per_Unit
FROM Retail_sales_Worked_data
GROUP BY Product_Category
ORDER BY Avg_Price_Per_Unit DESC;



-- Number of Transactions by Month

SELECT Month, COUNT(Transaction_ID) AS Num_Of_Transactions
FROM Retail_sales_Worked_data
GROUP BY Month
ORDER BY Month;



-- Total Sales Amount by Purchase Segmentation

SELECT Purchase_Segmentation, SUM(Total_Amount) AS Total_Sales_Amount
FROM Retail_sales_Worked_data
GROUP BY Purchase_Segmentation
ORDER BY Purchase_Segmentation;



-- Age Group Distribution

SELECT Age_Group, COUNT(Customer_ID) AS No_Of_Customers
FROM Retail_sales_Worked_data
GROUP BY Age_Group
ORDER BY Age_Group;



-- Top 5 Customers with Highest Sales

SELECT Customer_ID, SUM(Total_Amount) AS Total_Sales_Amount
FROM Retail_sales_Worked_data
GROUP BY Customer_ID
ORDER BY Total_Sales_Amount DESC limit 5;



-- Total Sales Amount Trend Over Time

SELECT Year, Month, SUM(Total_Amount) AS Total_Sales_Amount
FROM Retail_sales_Worked_data
GROUP BY Year, Month
ORDER BY Year, Month;

