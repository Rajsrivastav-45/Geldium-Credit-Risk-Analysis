# Geldium-Credit-Risk-Analysis
End-to-End Customer Delinquency &amp; Credit Risk Profiling Dashboard Built in Power BI, Excel, SQL, and Python
# 📊 Geldium Customer Delinquency & Credit Risk Profiling Dashboard

## 📌 Project Overview
An end-to-end **Credit Risk & Customer Delinquency Analytics** solution designed for **Geldium** to identify high-risk customer segments, evaluate financial exposure, and monitor delinquent accounts. Using **Excel, Python, MySQL, and Power BI**, this 3-page interactive dashboard helps risk managers optimize credit policies and prioritize collection efforts.

---

## 🛠️ Tech Stack & Tools Used
* **Microsoft Excel:** Initial data inspection, formatting, and baseline data checks.
* **Python (Pandas, NumPy, Matplotlib/Seaborn):** Automated data cleaning, handling missing values (median imputation for Income & Loan Balance), outlier detection, and Exploratory Data Analysis (EDA).
* **MySQL:** Relational database schema creation, data loading, and SQL queries for risk segmentation and KPI validation.
* **Power BI Desktop:** Data modeling, custom DAX measures, Calculated Columns, UI/UX neon theme design, and interactive 3-page dashboard development[span_0](start_span)[span_0](end_span)[span_1](start_span)[span_1](end_span).

---

## 🔄 End-to-End Project Workflow
1. **Data Cleaning & Preprocessing (Excel & Python):** Loaded raw customer records into Python using `pandas`, imputed missing values in `Income` and `Loan_Balance` using median values, verified data types, and performed statistical checks.
2. **Database Management & Querying (MySQL):** Exported cleaned dataset into MySQL to run analytical queries across credit card tiers, employment groups, and delinquency segments[span_2](start_span)[span_2](end_span)[span_3](start_span)[span_3](end_span).
3. **Data Modeling & DAX (Power BI):** Created custom DAX measures (`Delinquency Rate %`, `At-Risk Loan Balance`, `High-Risk Accounts`) and segmentation columns (`Income_Bracket`, `Utilization_Bucket`)[span_4](start_span)[span_4](end_span)[span_5](start_span)[span_5](end_span).
4. **Dashboard Design & Storytelling:** Built a 3-page dark-neon UI report with seamless page navigation, dynamic reference lines, and an actionable customer watchlist.

---

## 📂 Repository Structure
```text
📦 Geldium-Credit-Risk-PowerBI-Dashboard
 ┣ 📂 Assets                      # Dashboard screenshots & UI background templates
 ┣ 📂 Dataset                     # Raw CSV and cleaned Excel datasets
 ┣ 📂 Scripts                     # Python (.ipynb/.py) EDA & MySQL (.sql) query scripts
 ┣ 📄 Geldium_Risk_Dashboard.pbix # Main interactive Power BI file
 ┣ 📄 Geldium_Dashboard_Report.pdf# Static PDF export of all 3 dashboard pages
 ┗ 📄 README.md                   # Project documentation
```

---

## 📑 3-Page Dashboard Architecture

### 1️⃣ Page 1: Executive Home & Navigation Hub
* Central landing page featuring project scope, portfolio baseline snapshot, and interactive page navigation buttons.

### 2️⃣ Page 2: Demographic & Categorical Delinquency Overview
* **Key Metrics Tracked:**
  * **Total Customers:** 500[span_6](start_span)[span_6](end_span)[span_7](start_span)[span_7](end_span)
  * **Delinquent Customers:** 80[span_8](start_span)[span_8](end_span)[span_9](start_span)[span_9](end_span)
  * **Baseline Delinquency Rate:** 16.00%[span_10](start_span)[span_10](end_span)[span_11](start_span)[span_11](end_span)
  * **Avg Credit Utilization:** 49.13%[span_12](start_span)[span_12](end_span)[span_13](start_span)[span_13](end_span)
  * **Avg Debt-to-Income (DTI) Ratio:** 29.89%[span_14](start_span)[span_14](end_span)[span_15](start_span)[span_15](end_span)
* **Visual Breakdowns:**
  * Delinquency Rate by **Credit Card Type** (*Business, Student, Gold, Standard, Platinum*)[span_16](start_span)[span_16](end_span)[span_17](start_span)[span_17](end_span)
  * Delinquency Rate by **Employment Status** (*Unemployed, Employed, Self-Employed, Retired*)[span_18](start_span)[span_18](end_span)[span_19](start_span)[span_19](end_span)
  * Delinquent Customer Distribution by **Location** (*Los Angeles, Phoenix, Houston, Chicago, New York*)[span_20](start_span)[span_20](end_span)[span_21](start_span)[span_21](end_span)
  * Delinquency Trend across **Credit Score Tiers** (*Poor to Exceptional*)[span_22](start_span)[span_22](end_span)[span_23](start_span)[span_23](end_span)

### 3️⃣ Page 3: Financial Risk Exposure & Customer Watchlist
* **Financial Exposure KPIs:** Total Loan Portfolio ($), Avg Customer Income ($), Avg Loan Balance ($), At-Risk Loan Balance ($), and High-Risk Utilization Accounts (>50%).
* **Deep-Dive Analytics:**
  * **Loan Balance & Delinquency Rate by Income Bracket:** Analyzing whether lower-income segments carry disproportionate loan exposure.
  * **Credit Utilization Risk Buckets:** Tracking default spikes across `<30%`, `30–50%`, `50–75%`, and `>75%` utilization tiers.
  * **Customer Danger Zone (Scatter Matrix):** Mapping **Credit Utilization % vs. DTI Ratio %** with dynamic average reference lines to isolate extreme-risk accounts.
  * **High-Risk Customer Watchlist:** Actionable, filtered table of delinquent accounts sorted by at-risk loan balance.

---

## 💻 Key Code Snippets (Python, SQL & DAX)

### 🐍 Python (Data Cleaning & Imputation)
```python
import pandas as pd

# Load dataset
df = pd.read_csv('Dataset/geldium_raw_data.csv')

# Impute missing values using Median
df['Income'] = df['Income'].fillna(df['Income'].median())
df['Loan_Balance'] = df['Loan_Balance'].fillna(df['Loan_Balance'].median())

# Export cleaned data for SQL & Power BI
df.to_csv('Dataset/geldium_cleaned_data.csv', index=False)
```

### 🗄️ MySQL (Delinquency Summary by Card Type)
```sql
SELECT 
    Credit_Card_Type,
    COUNT(Customer_ID) AS Total_Customers,
    SUM(CASE WHEN Delinquent_Acc = 1 THEN 1 ELSE 0 END) AS Delinquent_Customers,
    ROUND(SUM(CASE WHEN Delinquent_Acc = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Delinquency_Rate_Pct
FROM customer_data
GROUP BY Credit_Card_Type
ORDER BY Delinquency_Rate_Pct DESC;
```

### 🧮 Power BI DAX Measures
```dax
// 1. Delinquency Rate %
Delinquency Rate % = DIVIDE([Delinquent Customers], [Total Customers], 0)

// 2. High-Risk Accounts (Utilization > 50%)
High-Risk Accounts = 
CALCULATE(
    COUNTROWS(Customer_Data), 
    KEEPFILTERS(Customer_Data[Credit_Utilization] > 0.50)
)

// 3. Income Bracket Segmentation
Income_Bracket = 
SWITCH(
    TRUE(),
    Customer_Data[Income] < 40000, "1. Low (< $40K)",
    Customer_Data[Income] >= 40000 && Customer_Data[Income] < 80000, "2. Medium ($40K - $80K)",
    "3. High ($80K+)"
)
```

---

## 📸 Dashboard Preview
* **Home Page:** 
  ![Home Page](Assets/1_Home_Page.png)
* **Delinquency Overview:** 
  ![Delinquency Overview](Assets/2_Delinquency_Overview.png)
* **Financial Risk & Watchlist:** 
  ![Risk Watchlist](Assets/3_Financial_Risk_Watchlist.png)

---

## 💡 Key Business Insights
1. **Card Tier Vulnerability:** **Business** and **Student** credit card holders exhibit the highest delinquency rates compared to **Platinum** and **Standard** tiers[span_24](start_span)[span_24](end_span)[span_25](start_span)[span_25](end_span).
2. **Employment Impact:** **Unemployed** (~19%) and **Employed** (~16%) segments show significantly higher default rates than **Retired** customers[span_26](start_span)[span_26](end_span)[span_27](start_span)[span_27](end_span).
3. **Utilization & DTI Danger Zone:** Accounts exceeding **50% Credit Utilization** combined with **>30% DTI Ratio** account for the largest share of at-risk loan balances[span_28](start_span)[span_28](end_span)[span_29](start_span)[span_29](end_span).
