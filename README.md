# 🚖 OLA: Ride-Hailing Data Analytics Project

> An end-to-end SQL and Tableau analytics project analyzing ride-hailing operations at OLA — covering booking trends, cancellation patterns, customer behavior, fleet performance, and driver ratings.

---

## 📌 Project Overview

OLA is one of India's largest ride-hailing platforms, operating across hundreds of cities and serving millions of customers daily. This project simulates a real-world data analyst role, exploring OLA's ride-hailing records to uncover actionable insights across five core business disciplines: utilization, cancellations, customer behavior, fleet & revenue, and analytics.

The dataset spans **103,024 total bookings** representing **₹56.53M in ride value**, queried using SQL (Google BigQuery) and visualized using Tableau Desktop.

---

## 🎯 Objectives

- Write advanced SQL queries using Google BigQuery
- Design Tableau visualizations for data-driven storytelling
- Identify patterns in booking status, revenue, and driver ratings
- Surface operational insights to improve platform performance

---

## ❓ Business Questions Addressed

The project answers **20 analytical questions** across five categories:

| Category | Focus |
|---|---|
| Operational Performance | Booking status distribution, ride volume trends |
| Customer Behaviour | Top customers, booking frequency, cancellation reasons |
| Fleet & Revenue | Revenue by vehicle type, distance vs. fare analysis |
| Quality Assessment | Driver ratings, customer ratings by vehicle type |
| Cancellations | Cancellation rates by initiator (customer vs. driver) |

---

## 📂 Dataset

The dataset represents OLA's ride-hailing records for the month of July 2024. Each row captures the full lifecycle of a booking event from request through completion.

**Sample columns include:**

`Date`, `Time`, `Booking_ID`, `Booking_Status`, `Customer_ID`, `Vehicle_Type`, `Pickup_Location`, `Drop_Location`, `V_TAT`, `C_TAT`, `Cancelled_Rides_by_Customer`, `Cancelled_Rides_by_Driver`, `Incomplete_Rides`, `Incomplete_Rides_Reason`, `Booking_Value`, `Payment_Method`, `Ride_Distance`, `Driver_Ratings`, `Customer_Rating`

---

## 🛠️ Tools & Technology Stack

| Tool | Role | Key Features Used |
|---|---|---|
| Google BigQuery | SQL Query Engine | `CREATE VIEW`, `WHERE`, `GROUP BY`, `ORDER BY`, `COUNT`, `AVG`, `SUM`, `MAX`, `MIN`, `LIMIT`, `Boolean` |
| Tableau Desktop | Data Visualisation | Line charts, bar charts, mixed charts, filters, dashboard layout |
| Google Datasource / Sample | Data Inspection | Dataset inspection, Data Cleaning, column validation, sample data review |
| SQL (Standard) | Query Language | `DDL (CREATE VIEW, PSL, SELECT)`, aggregation functions, conditional filtering |

---

## 🗂️ Business Problems & Solutions — SQL

All SQL queries were executed on Google BigQuery. Each query was implemented as a `CREATE VIEW` statement, making results reusable and queryable without re-running full base queries.

### Sample Queries

**1. Retrieve all successful bookings**
```sql
CREATE VIEW `ola_project_dataset.Successful_Bookings` AS
  SELECT * FROM `ola_project_dataset.bookings`
  WHERE Booking_Status = 'Success';
```

**2. Find the average ride distance for each vehicle type**
```sql
CREATE VIEW `ola_project_dataset.ride_distance_for_each_vehicle` AS
  SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
  FROM `ola_project_dataset.bookings`
  GROUP BY Vehicle_Type;
```

**3. Get the total number of cancelled rides by customers**
```sql
CREATE VIEW `ola_project_dataset.Cancelled_Rides_By_Customers` AS
  SELECT COUNT(*) FROM `ola_project_dataset.bookings`
  WHERE Booking_Status = 'Cancelled by Customer';
```

**4. List the top 5 customers by total number of rides booked**
```sql
CREATE VIEW `ola_project_dataset.Top_5_Customers` AS
  SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
  FROM `ola_project_dataset.bookings`
  GROUP BY Customer_ID
  ORDER BY total_rides DESC LIMIT 5;
```

**5. Find the maximum and minimum driver ratings for Prime Sedan bookings**
```sql
CREATE VIEW `ola_project_dataset.Max_Min_Driver_Rating` AS
  SELECT MAX(Driver_Ratings) AS max_rating,
         MIN(Driver_Ratings) AS min_rating
  FROM `ola_project_dataset.bookings`
  WHERE Vehicle_Type = 'Prime Sedan';
```

**6. Retrieve all rides where payment was made using UPI**
```sql
CREATE VIEW `ola_project_dataset.UPI_Payment` AS
  SELECT * FROM `ola_project_dataset.bookings`
  WHERE Payment_Method = 'UPI';
```

**7. Find the average customer rating per vehicle type**
```sql
CREATE VIEW `ola_project_dataset.AVG_Cust_Rating` AS
  SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
  FROM `ola_project_dataset.bookings`
  GROUP BY Vehicle_Type;
```

**8. Calculate total booking value of rides completed successfully**
```sql
CREATE VIEW `ola_project_dataset.total_successful_ride_value` AS
  SELECT SUM(Booking_Value) AS total_successful_ride_value
  FROM `ola_project_dataset.bookings`
  WHERE Booking_Status = 'Success';
```

**9. List all incomplete rides along with the reason**
```sql
CREATE VIEW `ola_project_dataset.Incomplete_Rides_Reason` AS
  SELECT Booking_ID, Incomplete_Rides_Reason
  FROM `ola_project_dataset.bookings`
  WHERE Incomplete_Rides = 1;
```

> The full set of 20 queries is available in the `/sql` folder of this repository.

---

## 📊 Tableau Dashboard — Visualisations

Five interactive dashboards were built in Tableau to surface the SQL findings visually. Dashboards translate results into intuitive charts that communicate operational insights without technical background.

**Design Principles:**
- Consistent color palette aligned with OLA brand identity (green/black)
- Clean layout with contextual backgrounds — icon imagery for rides and bookings
- Filters and parameters applied where relevant for interactive exploration
- Dashboard layout designed for executive summary and operational readout

**Dashboard Sections:**

| View | Visual Type | What It Shows |
|---|---|---|
| Overall | KPI Cards | Total bookings (103,024), Total revenue (₹56.53M) |
| Vehicle Type | Bar / Pie | Booking breakdown by vehicle category |
| Revenue | Line / Bar | Revenue trends across time and vehicle types |
| Cancellations | Stacked Bar | Cancellation rates split by customer vs. driver |
| Ratings | Mixed Chart | Driver and customer rating distributions |

📎 *[View the interactive Tableau dashboard →](#)* *(update with your Tableau Public link)*

---

## 🔍 Key Insights & Findings

### Operational Performance
- **Booking Status:** Complete driver-cancellation data is structured and processed by personal and related issues, providing a comprehensive view of fulfilled traffic.
- **Driver Cancellations:** A sizeable proportion of driver cancellations is attributed to personal and related issues, suggesting a need for better vehicle-maintenance support and scheduling coordination.
- **Incomplete Rides:** Note that started but did not complete represent a serious failure category worth monitoring closely, as they directly impact customer trust and revenue reliability.

### Customer Behaviour
- **Top Customers:** A small segment of customers account for a disproportionately high number of bookings, consistent with the Pareto principle — these customers are prime candidates for loyalty programmes.
- **Customer Ratings:** Ratings vary meaningfully by vehicle type, hinting that premium tiers (Prime Sedan, Prime SUV) may deliver more consistent experiences than economy categories.

### Fleet & Revenue
- **Ride Distance:** On average, more vehicles cover shorter distances; however, Auto and bike categories cover less than half the distances covered by others.
- **Driver Quality:** Max and minimum driver ratings flag Prime Sedan performance range, with the worst-rating outlier on the driver who may need coaching or review.

---

## 💡 Skills Demonstrated

**SQL / Data Engineering**
- Writing advanced analytical queries in BigQuery
- Filtering with `WHERE` clauses on categorical and Boolean columns
- Aggregating data efficiently with `COUNT`, `AVG`, `SUM`, `MAX`, `MIN`
- Sorting and limiting results with `ORDER BY` and `LIMIT`
- Translating business questions into SQL using `SQL`, `SQR`

**Data Visualisation & Analytics**
- Building interactive dashboards in Tableau (first, bar, pie, BAN histograms)
- Building interactive dashboards with filters and parameters
- Choosing appropriate visualisation types for each data question
- Applying business context to analytical outputs

---

## 📁 Repository Structure

```
ola-ride-hailing-analytics/
│
├── README.md
├── sql/
│   ├── 01_successful_bookings.sql
│   ├── 02_avg_ride_distance_by_vehicle.sql
│   ├── 03_cancelled_by_customer.sql
│   ├── 04_top_5_customers.sql
│   ├── 05_driver_ratings_prime_sedan.sql
│   └── ... (20 queries total)
│
├── dashboard/
│   └── OLA_Dashboard.twbx       ← Tableau workbook
│
└── data/
    └── ola_bookings_july2024.csv ← Sample / anonymised dataset
```

---

## 🚀 How to Run

1. **SQL Queries:** Import the dataset into Google BigQuery and run any `.sql` file from the `/sql` folder. Each query uses `CREATE VIEW` and can be executed independently.
2. **Tableau Dashboard:** Open `OLA_Dashboard.twbx` in Tableau Desktop (version 2022.1+). Connect to the dataset if prompted.
3. **Dataset:** The dataset used is a structured, anonymised sample representing July 2024 ride-hailing activity.

---

## 👤 About

**Iktedar Ahmed**
Data Analytics Portfolio | Assam, India

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/your-profile)
[![Portfolio](https://img.shields.io/badge/Portfolio-View-green)](https://sites.google.com/view/iktedar-ahmed/home)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/your-username)

> *"This project demonstrates how structured SQL analysis combined with interactive visualisation can surface actionable intelligence from large-scale ride-hailing data — supporting smarter decisions around driver management, customer satisfaction, and revenue optimisation."*

---

## 📄 License

This project is for portfolio and educational purposes. The dataset used is anonymised and does not represent real OLA user data.
