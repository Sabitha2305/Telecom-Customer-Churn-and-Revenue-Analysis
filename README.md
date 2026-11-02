# Telecom Customer Churn & Revenue Analytics

An end-to-end data analytics project that explores customer churn, revenue, service usage, and contract behaviour in a telecommunications business. The goal is to identify churn patterns and present the key findings through an interactive Power BI dashboard.

## Project Overview

Customer churn affects recurring revenue and long-term business growth. In this project, telecom customer data is analysed to understand:
- How many customers have churned and how many remain active.
- Which contract types have higher churn.
- How customer tenure, monthly charges, and services relate to churn.
- What business areas may need customer-retention attention.

## Tools & Technologies

- **Power BI** – interactive dashboard, KPI cards, charts, and report visuals.
- **Microsoft Excel** – data inspection, preparation, and preliminary analysis.
- **SQL** – querying and analysing customer data.

## Dataset

The project uses a Telco Customer Churn dataset containing **7,043 customer records** and customer, service, contract, billing, and churn attributes.

Main fields include:
- Customer information: `CustomerID`, `Gender`, `SeniorCitizen`, `Partner`, `Dependents`
- Account information: `Tenure`, `Contract`, `PaperlessBilling`, `PaymentMethod`
- Services: `PhoneService`, `InternetService`, `OnlineSecurity`, `OnlineBackup`, `TechSupport`, and streaming services
- Billing: `MonthlyCharges`, `TotalCharges`
- Target: `Churn`

## Analysis & Dashboard

The Power BI report contains a main dashboard and supporting report pages. It presents customer and churn performance using KPI cards, visual comparisons, and interactive filtering.

Key metrics include:
- Total Customers
- Churned Customers
- Active Customers
- Churn Rate
- Revenue / Total Charges
- Average Monthly Charges
- Average Tenure

## Power BI Dashboard Preview

![Telecom Customer Churn Dashboard](telecom-dashboard.png)

## Key Findings

Based on the supplied dataset:

| Metric | Result |
|---|---:|
| Total customers | 7,043 |
| Churned customers | 1,869 |
| Active customers | 5,174 |
| Overall churn rate | 26.54% |
| Total charges (sum of `TotalCharges`) | 12,405,611.65 |

### Churn by Contract Type

| Contract type | Churn rate |
|---|---:|
| Month-to-month | 42.71% |
| One year | 11.27% |
| Two year | 2.83% |

**Main takeaway:** Month-to-month customers have a substantially higher churn rate than customers on one-year or two-year contracts. Contract type is therefore an important area to investigate when designing customer-retention strategies.

## Business Recommendations

1. Review the customer experience for month-to-month subscribers and identify the reasons behind their higher churn.
2. Consider suitable long-term contract offers and loyalty benefits for customers who are likely to leave.
3. Monitor churn alongside tenure, monthly charges, payment method, and service usage.
4. Use the dashboard regularly to track churn KPIs and identify changes in customer behaviour.

## Files

- `projecttelecom.pbix` – Power BI report.
- `Telecom_Customer_Churn.xlsx` – Excel dataset and analysis workbook.

## How to Use

1. Download or clone this repository.
2. Open `projecttelecom.pbix` using Microsoft Power BI Desktop.
3. If Power BI asks for the source file, update the data source path to the Excel workbook included in this repository.
4. Refresh the report to load the data.

## Future Improvements

- Add deeper customer-segment analysis.
- Explore churn prediction using Python and machine learning.
- Add a regularly refreshed reporting workflow.

## Author

**Sabitha G**

Data Analytics | SQL | Excel | Power BI
