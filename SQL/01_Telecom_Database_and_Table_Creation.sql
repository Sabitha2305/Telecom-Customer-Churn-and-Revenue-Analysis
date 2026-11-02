create Database telecom;
use telecom;
create table Customer_churn(
CustomerID varchar(20) primary key,
Gender varchar(10),
SeniorCitizen int,
Partner varchar(5),
Dependents varchar(5),
Tenure int,
PhoneService varchar(5),
MultipleLines varchar(20),
InternetServie varchar(20),
OnlineSecurity varchar(30),
OnlineBackup varchar(30),
DeviceProtection varchar(30),
TechSupport varchar(30),
StreamingTV varchar(30),
StreamingMovies varchar(30),
Contract varchar(40),
PaperlessBilling varchar(5),
PaymentMethod varchar(50),
MonthlyCharges Decimal(10,2) NOT NULL,
TotalCharges varchar(20),
Churn varchar(5));

select* from customer_churn;
select count(*) from customer_churn;
describe customer_churn;
select customerid from customer_churn where customerid=null;
select customerid, count(*) from customer_churn group by customerid having count(*)>1;
select distinct churn from customer_churn;
SELECT DISTINCT Contract
FROM customer_churn;
SELECT DISTINCT InternetServie
FROM customer_churn;
alter table customer_churn rename column InternetServie to InternetService;
SELECT DISTINCT PaymentMethod
FROM customer_churn;
