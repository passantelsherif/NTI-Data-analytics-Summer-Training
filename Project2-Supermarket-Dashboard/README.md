🛒 Supermarket Dashboard – Data Analytics with Power Query & Power Pivot
Project Overview

This project demonstrates how to clean, transform, and analyze supermarket sales data using Power Query and Power Pivot, then build an interactive dashboard with KPIs and charts.

The workflow follows professional data analytics practices: data cleaning, feature engineering, enrichment with custom columns, and dashboard creation.

🔧 Data Preparation with Power Query

Check for Duplicated Data

Identify and remove duplicates to ensure data consistency.

Handle Blank Rows

Remove or impute missing rows/values.

Create a New Column – Invoice_ID

Merge the first three columns separated by -.

Transform Gender Column

Replace F → Female, M → Male.

Validate Price Column

Check for negative or unrealistic values.

Check Spelling in Product Line Column

Standardize product categories.

Add Serial Column

Auto-increment starting from 1.

Add Custom Column – Tax_5%

Formula: Unit_Price * Quantity * 0.05.

Add Custom Column – Total Sales

Formula: (Unit_Price * Quantity) + Tax_5%.

Add Conditional Column – Sales Category

Logic:

< 200 → Low

< 500 → Medium

>= 500 → High.

Extract Year from Date Column

Enables time-based analysis.

📊 Data Modeling with Power Pivot

Load transformed data into the Data Model.

Build relationships as needed.

Create measures and KPIs to summarize performance.

📈 Dashboard Design

The final interactive dashboard includes:

4 KPIs (e.g., Total Sales, Total Quantity, Average Sales, Number of Invoices).

6 Charts for deeper insights (e.g., Sales by Gender, Sales by Product Line, Monthly Trends, Sales Category Distribution).

🚀 Key Skills Applied

Data Cleaning & Transformation with Power Query

Data Modeling with Power Pivot

KPI & Metric Calculation

Data Visualization & Dashboard Design

📌 This project showcases how raw transactional data can be transformed into actionable business insights using Excel’s advanced BI tools.
