# Comprehensive Financial Analysis

## Objective
The primary goal of this project is to conduct a **detailed financial analysis** of a hypothetical retail company using a combination of **Excel**, **SQL**, **Python**, and **Power BI**. The analysis includes **data cleaning**, **sales performance evaluation**, **customer segmentation**, and **forecasting future performance**. The insights are visualized using **Power BI** to demonstrate key financial metrics, trends, and forecasts.

## Tools and Key Skills
- **Excel:** Advanced functions, Data Cleaning, Pivot Tables
- **SQL:** Data extraction, Group by queries, Aggregation functions
- **Python:** Data analysis, Visualization using `matplotlib` and `seaborn`
- **Power BI:** DAX Measures, Data Visualization, KPI creation

---

## 1. Excel: Data Cleaning and Preparation

### Data Preparation Steps:
- **Remove Duplicates:**  
  Used `=UNIQUE()` to ensure no duplicate transaction records exist.
  
- **Check for Missing Values:**  
  `=COUNTBLANK()` was used to identify any missing data in critical columns like `Transaction ID`, `Customer ID`, `Total Amount`, and `Product Category`.

- **Standardize Formats:**
  - **Dates:** Ensure that the date column have a uniform format.
  - **Other columns:** C.hecked if they are properly formatted as well

- **Data Validation:**  
  Applied `=IFERROR()` to handle potential errors in calculations or invalid data input.

### Financial Metrics Calculations:
- **Total Revenue by Category:**  
  Used `=SUMIFS(I:I, L:L, "Product Category")` to calculate revenue for each product category.

### Pivot Tables:
- **Sales Analysis Pivot Table:**
  - **Column:** Quarters
  - **Rows:** Product Category, Date (Grouped by Month)
  - **Values:**  
    - Sum of `Total Amount`  
    - Sum of `Quantity`
  
- **Customer Behavior Pivot Table:**
  - **Rows:** Age Groups (Grouped)
  - **Columns:** Gender
  - **Values:**  
    - Sum of `Total Amount`  
    - Sum of `Customer_ID`
    - Sum of `Quantity`

### Customer Segmentation:
- **Customer Value Segmentation:**  
  Created a segmentation formula:  
  `=IF(Value>=1000,"High Value",IF(Value>=500,"Medium Value","Low Value"))` to categorize customers based on their total spending.

- **Age Grouping:**  
  Created a new column to group customers into age segments:  
  `=IF(VALUE<30,"18 - 29",IF(VALUE<45,"30 - 44", IF(VALUE<60, "45-59", "60+")))`.

### Purpose of Excel Analysis:
This data cleaning and preparation ensure the dataset is accurate and ready for deeper analysis and visualization. The segmentation and categorization provide a foundation for understanding customer behavior, revenue trends, and performance by product categories.

---

## 2. SQL: Data Manipulation and Aggregation

To extract valuable insights from the dataset, several SQL queries were executed on the cleaned data.

### Key SQL Queries:
1. **Total Sales Amount by Product Category:**
   ```sql
   SELECT Product_Category, SUM(Total_Amount) AS Total_Sales_Amount
   FROM Retail_sales_Worked_data
   GROUP BY Product_Category
   ORDER BY Total_Sales_Amount DESC;
   ```

2. **Total Sales by Quarter:**
   ```sql
   SELECT Quarter, SUM(Total_Amount) AS Total_Sales_Amount
   FROM Retail_sales_Worked_data
   GROUP BY Quarter
   ORDER BY Quarter;
   ```

3. **Average Price per Unit by Product Category:**
   ```sql
   SELECT Product_Category, AVG(Price_per_Unit) AS Avg_Price_Per_Unit
   FROM Retail_sales_Worked_data
   GROUP BY Product_Category
   ORDER BY Avg_Price_Per_Unit DESC;
   ```

4. **Number of Transactions by Month:**
   ```sql
   SELECT Month, COUNT(Transaction_ID) AS No_Of_Transactions
   FROM Retail_sales_Worked_data
   GROUP BY Month
   ORDER BY Month;
   ```

5. **Sales by Purchase Segmentation:**
   ```sql
   SELECT Purchase_Segmentation, SUM(Total_Amount) AS Total_Sales_Amount
   FROM Retail_sales_Worked_data
   GROUP BY Purchase_Segmentation
   ORDER BY Purchase_Segmentation;
   ```

6. **Top 5 Customers by Total Amount Spent:**
   ```sql
   SELECT Customer_ID, SUM(Total_Amount) AS Total_Sales_Amount
   FROM Retail_sales_Worked_data
   GROUP BY Customer_ID
   ORDER BY Total_Sales_Amount DESC limit 5;
   ```

7. **Age Group Distribution:**
   ```sql
   SELECT Age_Group, COUNT(Customer_ID) AS No_Of_Customers
   FROM Retail_sales_Worked_data
   GROUP BY Age_Group
   ORDER BY Age_Group;
   ```
8. **Total Sales Amount Trend Over Time:**
   ```sql
   SELECT Year, Month, SUM(Total_Amount) AS Total_Sales_Amount
   FROM Retail_sales_Worked_data
   GROUP BY Year, Month
   ORDER BY Year, Month;
   ```

### Purpose of SQL Analysis:
These queries are designed to gather critical insights about sales performance, customer segmentation, and transaction trends. The results help to identify high-value customers, understand quarterly performance, and track sales over time.

---

## 3. Python: Data Analysis and Visualization

Using **Python**, I performed additional analysis and visualized key metrics using **matplotlib** and **seaborn**.

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv("Retail_sales_Worked_data.csv")

# Bar Plot showing Total Amount per Product Category
plt.figure(figsize=(12, 6))
sns.barplot(x='Product_Category', y='Total_Amount', data=df)
plt.title('Total Amount per Product Category')
plt.xlabel('Product Category')
plt.ylabel('Total Amount')
plt.xticks(rotation=45)
plt.show()
```
![Total Amount by Product Category](https://github.com/user-attachments/assets/e5a01617-bac2-44ae-ba2f-6c41a1f2f361)

```python
# Pie Chart showing Purchase Segmentation distribution
purchase_segmentation_counts = df['Purchase_Segmentation'].value_counts()

plt.figure(figsize=(8, 8))
plt.pie(purchase_segmentation_counts, labels=purchase_segmentation_counts.index, autopct='%1.1f%%', startangle=140)
plt.title('Purchase Segmentation distribution')
plt.show()
```
![Purchase Segmentation Distribution](https://github.com/user-attachments/assets/90669188-530a-471c-8eb8-ab77de66b865)


```python
# Box Plot of Total Amount by Age Group
plt.figure(figsize=(10, 6))
sns.boxplot(x='Age_Group', y='Total_Amount', data=df)
plt.title('Total Amount by Age Group')
plt.xlabel('Age Group')
plt.ylabel('Total Amount')
plt.xticks(rotation=45)
plt.show()
```
![Total Amount By Age Group](https://github.com/user-attachments/assets/2d2b8f7c-d94c-4da7-832c-0f046d629d7e)


```python
# Violin Plot of Quantity distribution by Gender
plt.figure(figsize=(10, 6))
sns.violinplot(x='Gender', y='Quantity', data=df)
plt.title('Quantity Distribution by Gender')
plt.xlabel('Gender')
plt.ylabel('Quantity')
plt.show()
```
![Quantity Distribution by Gender](https://github.com/user-attachments/assets/0ae2b3cb-a221-4b5e-9746-9b32b4342759)


```python
# Bar Chart of Total Amount trend by Quarter
plt.figure(figsize=(10, 6))
total_amount_by_quarter = df.groupby('Quarter')['Total_Amount'].sum().reset_index()
sns.barplot(x='Quarter', y='Total_Amount', data=total_amount_by_quarter)
plt.title('Total Amount Trend by Quarter')
plt.xlabel('Quarter')
plt.ylabel('Total Amount')
plt.show()
```
![Total Amount Trend by Quarter](https://github.com/user-attachments/assets/0805d8bb-52de-408a-9ba5-aa761e97a3ba)


### Purpose of Python Analysis:
- **Visualizations** clarify trends and patterns that are difficult to discern from raw data alone.
- **Bar Plots** help to quickly identify high-performing product categories.
- **Pie Charts** show the distribution of purchase segmentation, aiding in understanding customer demographics.
- **Box and Violin Plots** provide insights into sales distribution across different age groups and gender, revealing potential demographic patterns for targeted marketing.

---

## 4. Power BI: Data Visualization and KPI Creation

In **Power BI**, I created several **KPIs** and **visualizations** to summarize the key findings from the analysis:

### KPIs:
- **Total Sales Amount:** Sum of all sales transactions.
- **Average Price per Unit:** Calculated using DAX:  
  `Average Price per Unit = DIVIDE(SUM([Total Amount]), SUM([Quantity]))`
- **Number of Transactions:** Total count of transactions across all product categories.
- **Product Category:** Distinctcount of all the product.

### Power BI Visualizations:
1. **Average Price per Unit by Product Category (Area Chart):**  
   This chart helps visualize pricing trends for different product categories over time.
   
2. **Transactions by Age Group (Donut Chart):**  
   Provides a clear breakdown of transactions by customer age groups, aiding in demographic analysis.
   
3. **Sales by Product Category (Clustered Bar Chart):**  
   Highlights which product categories drive the most revenue, helping to inform inventory and marketing decisions.
   
4. **Sales by Purchase Segmentation (Pie Chart):**  
   Visualizes the distribution of sales across different customer segments, providing insights for targeted marketing.
   
5. **Sales Revenue by Month (Clustered Column Chart):**  
   Displays monthly sales trends to identify seasonality and high-performing months.
   
6. **Sales Revenue by Quarter (Funnel Chart):**  
   Highlights quarterly performance, helping assess financial goals and quarterly targets.

7. **Slicers:**  
   Slicers for **Year**, **Month**, **Quarter**, and **Gender** allow for interactive filtering of the data, enabling dynamic analysis.

![Screenshot Retails Sales Dashboard](https://github.com/user-attachments/assets/647a26a3-6003-4113-aca2-f42ea8414496)


### Purpose of Power BI Visualizations:
These visualizations offer an interactive way to explore the data, providing stakeholders with actionable insights to make informed decisions on product strategy, customer segmentation, and sales trends. The **KPI metrics** provide a quick overview of the company’s financial health.

---

## Recommendations, Findings, and Limitations

### 1. Recommendations

Based on the analysis conducted, the following strategic recommendations are proposed to improve business performance and optimize future operations:

#### Focus on High-Performing Product Categories
- **Key Product Categories:** The analysis revealed that certain categories consistently generate higher revenue. For instance, products in the **Clothing** and **Electronics** categories showed strong sales figures.
  - **Recommendation:** *Focus on expanding inventory, marketing efforts, and promotional campaigns for these high-performing categories to maximize revenue.*

#### Target High-Value Customer Segments
- **Customer Segmentation:** The segmentation analysis identified a group of **high-value customers** who contribute significantly to total revenue.
  - **Recommendation:** *Develop loyalty programs and personalized marketing strategies for these high-value customers to strengthen retention and increase repeat purchases.*

#### Optimize Pricing Strategies Based on Customer Demographics
- **Price Sensitivity by Age Group:** The analysis showed a significant variance in average spending across different age groups, with **middle-aged customers (30-44)** contributing the highest average transaction values.
  - **Recommendation:** *Consider implementing targeted pricing strategies, such as discounts, bundles, or tailored promotions for different age groups to drive sales across all customer segments.*

#### Improve Inventory Management Using Sales Trends
- **Seasonality in Sales:** The analysis of sales trends by quarter demonstrated peak sales during specific months, especially in Q2 and Q4.
  - **Recommendation:** *Align inventory purchasing and stock levels with these seasonal trends to avoid stockouts during high-demand periods and reduce excess inventory during slower months.*

#### Expand into Underperforming Segments
- **Underperforming Categories:** Certain product categories, like the Beauty products, showed lower sales performance.
  - **Recommendation:** *Explore the reasons behind the underperformance of these categories. Consider running special promotions or increasing visibility on the website to boost interest and sales.*

---

### 2. Key Findings

The analysis provided several important insights into the company's performance and customer behavior, summarized below:

#### Revenue Concentration in Core Categories
- A significant portion of total revenue comes from **Electronics** and **Clothing** categories (around 70-80%), indicating strong customer demand for these products.

#### Seasonal Sales Patterns
- Sales showed clear **seasonal spikes** during key periods, most notably in the second and fourth quarters (aligned with the summer vacation and holiday shopping seasons). This trend highlights the importance of preparing for these peak periods.

####  Sales Performance by Customer Age
- The **30-44 age group** was the most significant contributor to overall revenue, with higher average spend per transaction compared to younger or older groups. This demographic is likely a key target for premium and high-end products.

#### Gender-Based Sales Distribution
- There was a relatively equal distribution of sales between **male** and **female** customers, with minor variations in purchasing behavior. Male customers generally spent more on Electronics, while female customers showed a preference for Clothing.

---

### 3. Limitations of the Analysis

While the analysis yielded valuable insights, several limitations were encountered that may influence the accuracy or completeness of the findings:

####  Lack of Detailed Product Information
- **Product Categorization:** The dataset lacked detailed descriptions or subcategories for individual products. As a result, the analysis of product performance was limited to broad categories (e.g. Electronics). More granular insights could have been obtained with finer product details.
- **Recommendation:** *Enhance data granularity by capturing more detailed product attributes, such as brands, styles, and price ranges.*

####  External Factors Not Considered
- **Economic and Market Conditions:** The analysis did not account for external factors such as **economic downturns**, **competitor actions**, or **market trends**, which could have influenced customer spending patterns during the periods analyzed.
- **Recommendation:** *Incorporate external economic indicators and competitor analysis in future studies to gain a more comprehensive understanding of the factors driving sales performance.*

####  Limited Information on Customer Lifetime Value
- **Customer Behavior Over Time:** The analysis focused primarily on transaction data from a specific period. **Customer lifetime value (CLV)** and long-term purchasing behavior were not analyzed due to the lack of historical data.
- **Recommendation:** *Track customer behavior over longer periods to calculate CLV and identify opportunities for increasing customer retention and long-term profitability.*

####  Power BI Data Refresh Limitations
- **Real-Time Data:** Power BI visualizations were based on static data, meaning they did not update in real time. Thus, any significant changes in sales trends after the analysis would not be reflected in the dashboards.
- **Recommendation:** *Implement real-time data feeds in Power BI to continuously monitor sales performance and make dynamic business decisions.*

---

### Conclusion

This financial analysis has provided actionable insights into product performance, customer behavior, and sales trends. While the analysis effectively identified key areas for growth and improvement, addressing the limitations and incorporating more advanced models and data will enhance the accuracy and depth of future insights. By focusing on high-performing categories, targeting high-value customers, and optimizing inventory based on seasonal trends, the company can improve profitability and maintain a competitive edge in the market.
```
