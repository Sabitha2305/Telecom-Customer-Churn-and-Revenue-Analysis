# Telecom Customer Churn & Revenue Analytics

An end-to-end data analytics project exploring customer churn, revenue, service usage, and contract behaviour in a telecommunications business.

## Project Overview

Customer churn affects recurring revenue and long-term business growth. This project analyses telecom customer data to identify churn patterns and understand customer behaviour.

## Tools & Technologies

- **SQL (MySQL)** – Database creation, data exploration, table creation, joins, and business analysis.
- **Microsoft Excel** – Data inspection, preparation, and analysis.
- **Power BI** – Interactive dashboards, KPI cards, and visualizations.

## Dataset

The project uses a Telco Customer Churn dataset containing 7,043 customer records.

Main attributes include:
- Customer information
- Account and contract information
- Internet and phone services
- Billing information
- Customer churn status

## SQL Analysis

SQL analysis was performed using MySQL.

Key activities:
- Database and table creation.
- Data exploration and validation.
- NULL and duplicate checking.
- Exploring distinct values.
- Creating separate `customers`, `services`, and `billing` tables.
- Practising SQL JOIN operations.
- Analysing customer behaviour, services, contracts, and churn.

**SQL Scripts:** [View SQL folder](./SQL/)

## Excel Analysis

- Data inspection and preparation.
- Data cleaning and validation.
- Preliminary customer and revenue analysis.

## Power BI Dashboard

The Power BI dashboard presents customer and churn performance through KPI cards, charts, and interactive filters.

Key metrics:
- Total Customers
- Churned Customers
- Active Customers
- Churn Rate
- Revenue
- Average Monthly Charges
- Average Tenure

### Dashboard Preview

[Telecom Customer Churn Dashboard](Telecom-dashboard.png)

## Key Findings

| Metric | Result |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Active Customers | 5,174 |
| Overall Churn Rate | 26.54% |

### Churn by Contract Type

| Contract Type | Churn Rate |
|---|---:|
| Month-to-month | 42.71% |
| One year | 11.27% |
| Two year | 2.83% |

**Main Insight:** Month-to-month customers have a significantly higher churn rate than customers on one-year and two-year contracts.

## Business Recommendations

1. Investigate reasons for higher churn among month-to-month customers.
2. Consider suitable long-term contract offers and loyalty benefits.
3. Monitor customer behaviour, tenure, charges, payment methods, and service usage.
4. Track churn KPIs regularly to support customer-retention decisions.

## Project Files

- `SQL/` – MySQL scripts for data exploration and analysis.
- `Telecom_Customer_Churn.xlsx` – Excel dataset and analysis.
- `projecttelecom.pbix` – Interactive Power BI dashboard.
- `telecom-dashboard.png` – Power BI dashboard screenshot.

## How to Use

1. Clone or download this repository.
2. Open the SQL scripts in MySQL Workbench and run them in the appropriate order.
3. Open `projecttelecom.pbix` in Power BI Desktop.
4. If prompted, update the Excel data-source path to the workbook in the repository.
5. Refresh the report.

## Future Improvements

- Customer segmentation analysis.
- Churn prediction using Python and machine learning.
- Automated reporting and refresh workflows.

## Author

**Sabitha G**

Data Analytics | SQL | Excel | Power BI
