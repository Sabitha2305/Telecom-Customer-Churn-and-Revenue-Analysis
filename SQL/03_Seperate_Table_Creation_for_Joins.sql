#customer table
CREATE TABLE customers AS
SELECT
    CustomerID,
    Gender,
    SeniorCitizen,
    Partner,
    Dependents,
    Tenure
FROM customer_churn;
select * from customers;

#service table
CREATE TABLE services AS
SELECT
    CustomerID,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies
FROM customer_churn;
select * from services;

#Billing table
CREATE TABLE billing AS
SELECT
    CustomerID,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM customer_churn;
select * from billing;
