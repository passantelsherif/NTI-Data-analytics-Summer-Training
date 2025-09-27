# 🌍 Final Integrated Project – Global Travel & Tourism Agency  

## 📌 Project Overview  
This project is the **capstone of the NTI Data Analytics Training**.  
It simulates the operations of a **global travel and tourism agency** that manages clients, employees, bookings, flights, and hotels.  

The project covers the full data pipeline:  
1. **Problem Definition & ERD Design**  
2. **Mapping & Normalization**  
3. **Database Implementation (SQL)**  
4. **Data Insertion & Querying**  
5. **Integration with Excel**  
6. **Multi-page Dashboard with KPIs & Visualizations**  

---

## 📝 Problem Description  

- **Clients**: Identified by `client_id`. Includes full name, nationality, passport number, and email.  
- **Branches**: Agency operations are managed through branches (`branch_id`, name, city, country).  
- **Employees**: Travel agents (`emp_id`, name, position, hire date). Each assigned to a branch.  
- **Airlines**: Partner airlines (`airline_code`, name).  
- **Hotels**: Partner hotels (`hotel_id`, name, star rating, city, country).  
- **Payment Methods**: `payment_id`, method name, and payment date.  
- **Bookings**: Core service with `reference_no`, booking date, trip dates, and total cost.  
  - Each booking is made by one client.  
  - Managed by one employee.  
  - Handled by one branch.  
  - Paid by one payment method.  
  - Includes one flight (airline) and one hotel stay.  

---

## 🗂️ Data Modeling  

### ERD  
- Designed to capture relationships between **Clients, Employees, Branches, Airlines, Hotels, Payment Methods, and Bookings**.  

### Mapping  
- Entity-to-table mapping and normalization steps applied to ensure data integrity.  

### Normalization  
- Database normalized to **3NF** to remove redundancy and ensure efficient querying.  

---

## 💻 SQL Implementation  

1. **Schema Creation**  
   - SQL scripts to create tables for all entities.  
2. **Constraints & Relationships**  
   - Primary Keys, Foreign Keys, and Checks.  
3. **Sample Data Insertion**  
   - 5 records per table for testing.  
4. **Queries**  
   - Example business queries (total bookings, most active branch, top clients, etc.).  

---


## 📊 Dashboard Design  

Before building the dashboards in Power BI/Excel, the layout and visuals were first **designed in Figma** to ensure clear storytelling and professional UI/UX.  

### KPIs  
- Total Bookings  
- Total Revenue  
- Active Clients  
- Most Profitable Branch  

### Visualizations  
- **Bookings by Year/Month** (line chart)  
- **Top Airlines by Bookings** (bar chart)  
- **Hotel Performance by City** (column chart)  
- **Revenue by Branch** (map or bar chart)  
- **Payment Methods Share** (pie chart)  
- **Top Clients by Revenue** (bar chart)  

---

## 🚀 Key Skills Applied  

- **ERD & Database Design**  
- **Mapping & Normalization (3NF)**  
- **SQL Implementation (DDL, DML, Queries)**  
- **Power Query for Data Cleaning**  
- **Power Pivot for Modeling**  
- **Excel Dashboards with KPIs & Charts**  

---

📌 *This project demonstrates the complete data analytics workflow – from database design and SQL implementation to interactive dashboarding – applied to a real-world Travel & Tourism Agency case study.*  
