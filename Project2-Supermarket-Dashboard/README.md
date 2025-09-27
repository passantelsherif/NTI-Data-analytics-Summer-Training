# 🛒 Supermarket Dashboard – Data Analytics with Power Query & Power Pivot  

## 📌 Project Overview  
This project demonstrates how to clean, transform, and analyze supermarket sales data using **Power Query** and **Power Pivot**, then build an **interactive dashboard** with KPIs and charts.  

The workflow follows professional data analytics practices: data cleaning, feature engineering, enrichment with custom columns, and dashboard creation.  

---

## 🔧 Data Preparation with Power Query  

1. **Check for Duplicated Data**  
   - Identify and remove duplicates to ensure data consistency.  

2. **Handle Blank Rows**  
   - Remove or impute missing rows/values.  

3. **Create a New Column – Invoice_ID**  
   - Merge the first three columns separated by `-`.  

4. **Transform Gender Column**  
   - Replace `F → Female`, `M → Male`.  

5. **Validate Price Column**  
   - Check for negative or unrealistic values.  

6. **Check Spelling in Product Line Column**  
   - Standardize product categories.  

7. **Add Serial Column**  
   - Auto-increment starting from 1.  

8. **Add Custom Column – Tax_5%**  
   - Formula: `Unit_Price * Quantity * 0.05`.  

9. **Add Custom Column – Total Sales**  
   - Formula: `(Unit_Price * Quantity) + Tax_5%`.  

10. **Add Conditional Column – Sales Category**  
   - Logic:  
     - `< 200 → Low`  
     - `< 500 → Medium`  
     - `>= 500 → High`.  

11. **Extract Year from Date Column**  
   - Enables time-based analysis.  

---

## 🗂️ Data Modeling with Power Pivot  
- Load transformed data into the **Data Model**.  
- Build relationships as needed.  
- Create **measures and KPIs** to summarize performance.  

---

## 📊 Dashboard KPIs  

1. **إجمالي المبيعات** (Total Sales)  
2. **إجمالي الربح** (Total Profit)  
3. **إجمالي الخصومات** (Total Discounts)  
4. **عدد الطلبات** (Number of Orders)  
5. **عدد العملاء** (Number of Customers)  

---

## 📈 Dashboard Visuals  

1. **الربح على مدار السنوات (Profit over Years)** → Line Chart  
2. **المبيعات حسب Client Segment** → Pie Chart  
3. **أعلى 10 منتجات الأكثر طلبًا** → Column/Bar Chart  
4. **أعلى 10 منتجات الأكثر تحقيقًا للمبيعات (الربح)** → Column/Bar Chart  
5. **إجمالي الربح لكل Ship Mode** → Pie Chart  
6. **أعلى 10 عملاء حققت الشركة منهم أرباح** → Column/Bar Chart  

---

## 🚀 Key Skills Applied  
- Data Cleaning & Transformation with **Power Query**  
- Data Modeling with **Power Pivot**  
- KPI & Metric Calculation  
- Interactive Dashboard Design with **Excel/Power BI**  

---

📌 *This project showcases how raw transactional data can be transformed into actionable business insights using Excel’s advanced BI tools.*  
