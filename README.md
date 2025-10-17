# 🛍️ Retail Sales & Customer Insights Dashboard

### 📊 Tools Used:
Power BI | SQL (PostgreSQL) | Excel

---

## 📁 Project Overview
This project analyzes retail sales data to uncover **key business insights**, such as top-performing regions, customer segments, and yearly growth trends.  
It demonstrates an **end-to-end data analysis workflow** — from SQL-based data exploration to Power BI dashboard visualization.

---

## 🎯 Objectives
- Identify top-selling categories, regions, and customer segments.  
- Analyze yearly and monthly sales trends.  
- Calculate key KPIs such as Total Sales, Avg Sales per Order, and Sales per Customer.  
- Create an interactive Power BI dashboard for management decision-making.

---

## 🧰 Dataset
**Source:** [Kaggle - Superstore Sales Dataset](https://www.kaggle.com/datasets/juhi1996/superstore?select=Sample+-+Superstore.csv)  
**File Used:** `Superstore_Sales_Cleaned.csv`  
**Rows:** ~10,000  
**Columns:** 19 (including derived columns `Year` and `Month`)

---

## 📊 Key KPIs
| KPI | Formula / Definition |
|-----|------------------------|
| **Total Sales** | `SUM(Sales)` |
| **Total Orders** | `DISTINCTCOUNT(Order ID)` |
| **Distinct Customers** | `DISTINCTCOUNT(Customer ID)` |
| **Avg Sales per Order** | `Total Sales / Total Orders` |
| **Sales per Customer** | `Total Sales / Distinct Customers` |

---

## 🧮 SQL Analysis (PostgreSQL)
Performed SQL-based data exploration and KPI validation using the cleaned dataset.  
Example queries include:

```sql
-- Total Sales
SELECT ROUND(SUM(Sales), 2) AS Total_Sales FROM superstore_sales;

-- Sales by Region
SELECT Region, ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

📈 Power BI Dashboard

An interactive dashboard visualizes sales performance and customer behavior.

Key Visuals:

KPI Cards: Total Sales, Orders, Avg per Order, Sales per Customer

Bar Chart: Sales by Category

Line Chart: Monthly Sales Trend

Donut Chart: Segment-wise Sales Distribution

Tree Map: Sub-category Contribution

Table: Top 10 Customers

Pie Chart: Sales by Region

💡 Insights

West Region generates the highest sales contribution.

Corporate Segment leads in total revenue share.

Technology and Office Supplies categories are top performers.

Sales show steady YoY growth and strong performance in Q4 months.

Top 10 customers account for ~20% of total revenue.

🏁 Conclusion

This project demonstrates:

Data extraction and transformation

SQL-based business KPI calculation

Power BI visualization and storytelling

End-to-end data analytics process from raw data to insights

👨‍💻 Author

Aadi Chauhan
📍 Aspiring Data Analyst | Power BI | SQL | Excel | Statistics Post Graduate
