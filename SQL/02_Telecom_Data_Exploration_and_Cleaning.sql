select * from customer_churn;
 /*1. Total Customers
 Objective: Find the total number of customers in the dataset.*/
select count(*) as Total_customers from customer_churn;
#Insight: This query counts all customer records and gives the total customer base available for analysis.

/*2. Total Churned Customers
Objective: Find the total number of customers who have churned.*/
select count(*) as Total_Churned_Customers from customer_churn where Churn='yes';
#Insight: This query counts all customers whose status is 'Yes' in the Churn column, representing customers who have left the telecom company.

/*Total Active Customers
Objective: Find customers who are still active (not churned)
Insight: This query returns the number of customers who have not churned and are still active with the company.*/
select count(*) as Active_Customers from customer_churn where churn='no';

/*4.  Churn Rate (%)
Objective: To find the percentage of customers who have churned from the total customers.
Insight: This shows how many customers left the company. A higher churn rate means more customers are leaving, which is not good for the business.*/
select round(sum(case when churn='yes' then 1
	else 0 end)*100.0/count(*),2) as Churn_Rate from customer_churn;

/*5. Total Revenue
Objective: To calculate the total revenue generated from all customers in the dataset.*/
select round(sum(totalcharges),2) as Total_Revenue from customer_churn; 

/*6. Average Monthly Charges*/
select round(avg(monthlycharges),2) as Average_Monthly_Charges from customer_churn;

/*7. Average Tenure*/
select round(avg(tenure),2) as Average_Tenure from customer_churn;

/*8. Minimum and Maximum Monthly Charges*/
select min(monthlycharges) as Minimum_Monthly_Charge, 
	max(monthlycharges) as Maximum_Monthly_Charges from customer_churn;

/*9. Customers by Gender*/
select gender, count(*) as Gender_count 
	from customer_churn group by gender;

/*10. Customers by Contract Type*/
select contract, churn, count(*) Customers_by_Contract_Type from customer_churn group by contract,churn;

/*11. Customers by Payment Method*/
select paymentmethod, count(*) as Customer_Payment_Method from customer_churn group by paymentmethod;

/*12. Customers by Internet Service*/
Select internetservice, count(*) as Customer_Internet_Service from customer_churn group by InternetService;

/*13. Churn by Gender*/
select churn, gender, count(*) as Churn_by_Gender from customer_churn group by churn, gender;

/*14. Average monthly charges by contract*/
select contract, round(avg(monthlycharges),2) as Average_Monthlycharges from customer_churn group by contract;

/*15. Average total charges by contract*/
select contract, round(avg(totalcharges),2) as Average_Total_charges from customer_churn group by contract;

/*16. Number of senior citizens who churned*/
select seniorcitizen, churn, count(*) No_of_Seniorcitizen from customer_churn where churn='yes' group by seniorcitizen;

/*17. Top 10 Customers by Total Charges*/
select * from 
(select *,dense_rank() over(order by totalcharges desc) as Top10_Highest_Total_Charges from customer_churn) t
	where Highest_Total_Charges<11;
    
/*18. Top 10 Customers by Total Charges*/
select * from(
select *, dense_rank() over(order by tenure desc) Top10_Longest_Tenure from customer_churn) t
where Top10_Longest_Tenure<11;

SELECT * FROM customer_churn
ORDER BY tenure DESC
LIMIT 10;

/*19. Customers with Monthly Charges Above Average*/
select customerid, monthlycharges from customer_churn 
	where MonthlyCharges >(select avg(MonthlyCharges) from customer_churn);
    
/*20. Customers with Tenure Above Average
Objective: To identify customers whose tenure is greater than the average tenure of all customers. This helps identify long-term customers who are more likely to be loyal and retained.*/
select customerid, tenure from customer_churn where tenure>
	(select round(avg(tenure),2) from customer_churn);

/*21. Month-to-Month Customers Who Churned
Objective: To identify customers who were on month-to-month contracts and churned. This helps the company understand whether customers with flexible contracts are more likely to leave.*/
select * from customer_churn;
select customerid, contract, churn from customer_churn where contract='Month-to-Month' and churn='Yes';

/*22. Rank Customers by Total Charges
Objective: To rank customers based on their Total Charges, 
helping identify the highest-value customers who have contributed the most revenue to the company.*/
select customerid, Totalcharges, rank() over(order by totalcharges desc) as RankCustomers_by_Total_Charges from customer_churn;

/*23. Dense Rank Customers by Tenure
Objective: To rank customers based on their tenure using the DENSE_RANK() window function. 
It helps identify the longest-serving customers and analyze customer loyalty and retention.*/
select customerid, tenure, dense_rank() over(order by tenure desc) as Denserank_Customers_by_tenure from customer_churn;

/*24. Running Total of Revenue
Objective: To calculate the running (cumulative) total of revenue generated by customers based on their Total Charges. 
This helps analyze how revenue accumulates from the highest-paying customers downward.*/
select customerid, 
	round(sum(totalcharges) 
    over(order by totalcharges desc rows between unbounded preceding and current row),2) as Running_Total_Of_Revenue
    from customer_churn;

/*25. Create a View for Churned Customers
Objective: To create a view that stores all churned customers. 
This makes it easier to access and analyze churned customer data without repeatedly writing the same query.*/
create view Churned_Customer as
	select * from customer_churn where churn='Yes';
select * from churned_customer;

RENAME TABLE churned_customer TO churned_customers;
select * from churned_customers;

/*26. Create a View for High-Value Customers*/
#High Value Customers are customers who generate more revenue for the company than the average customer.
create view High_Value_Customers as
select customerid, Totalcharges as Totalcharges from customer_churn where Totalcharges>(
select avg(totalcharges)from customer_Churn);
select * from High_Value_Customers;

/*27. Create a CTE for Revenue Analysis*/
select * from customer_churn;
#1. Above Average Revenue Customers
with revenue_cte as(
select Customerid, Totalcharges from customer_churn),
avg_cte as
(select avg(Totalcharges) Average from customer_churn group by customerid)
select a.customerid, a.totalcharges, b.average from revenue_cte as a cross join avg_cte as b 
where Totalcharges>Average;

#2. Revenue by Contract Type
select * from customer_churn;
with cte as
(select Contract, round(sum(Totalcharges),2) as Revenue
from customer_churn group by Contract),
rank_cte as
(select Contract, Revenue, 
dense_rank() over(order by revenue desc) as Highest_Total_Revenue from cte)
select * from rank_cte where Highest_Total_Revenue=1;

#3. Average Revenue by Internet Service
with cte as(
select internetservice,round(avg(TotalCharges),2) Average_Revenue from customer_churn group by internetservice)
select Internetservice, Average_Revenue from cte;

#4. Revenue by Payment Method
select * from customer_churn;
with payment_cte as(
select paymentmethod, round(sum(TotalCharges),2) as Revenue from customer_churn group by PaymentMethod),
highest_revenue_cte as(
select paymentmethod, Revenue, dense_rank() over(order by Revenue desc) as Highest_Revenue from payment_cte)
select * from highest_Revenue_cte where Highest_Revenue=1;

#5. Top 10 Revenue Customers
with cte as
(select customerid, Totalcharges as Revenue, 
dense_Rank() over(order by TotalCharges desc) Top_10_Revenue_Customer from customer_churn)
select * from cte where Top_10_Revenue_Customer<11;

#6. Below Average Revenue Customers
with cte as(
select customerid, totalcharges as Revenue, 
(select round(avg(totalcharges),2) Average from customer_churn) as Average from customer_churn)
select * from cte where Revenue<Average;

#7. Revenue by Customer Segment
select customerid, Totalcharges,
case when totalcharges>2000 then 'High'
	 when totalcharges between 1000 and 2000 then 'Average'
     else 'low' end as t from customer_churn;
     
#8. Customer Revenue Ranking
with cte as(
select customerid, totalcharges as Revenue from customer_churn)
select Customerid, Revenue, rank() over(order by Revenue desc) Revenue_Ranking from cte;

/*28. Churn Analysis*/
#1.High-Value Churned Customers
with cte as(
select CustomerID, churn, totalcharges as Revenue from customer_churn 
group by customerid, churn
order by revenue desc)
select * from cte where churn='yes';

#2. Churn by Contract Type
with cte as(
select contract, churn, count(*) as Highest_churn from customer_churn group by contract, churn )
select * from cte where churn='yes' order by Highest_churn desc;

#3. Churn by Internet Service
with cte as(
select InternetService, churn, count(*) as Highest_churn from customer_churn group by InternetService, churn )
select * from cte where churn='yes' order by Highest_churn desc;

#4. Churn by Payment Method
with cte as(
select Paymentmethod, churn, count(*) as Highest_churn from customer_churn group by Paymentmethod, churn )
select * from cte where churn='yes' order by Highest_churn desc;

#5. Churn Percentage by Gender
with cte as(
select gender, 
round(sum(case when churn='yes' then 1 else 0 end)*100.0/count(*),2) Percentage 
from customer_churn group by gender)
select * from cte;

#6. Revenue Lost by Contract
with cte as(
select Contract, churn, round(sum(totalcharges),2) as Revenue from customer_churn group by contract, churn)
select * from cte where churn='yes';

#7. Contract Churn Ranking
with cte as(
select Contract, churn,count(*) count_churn from customer_churn group by contract, churn)
select *, rank() over(order by count_churn desc) as Churn_Ranking from cte where churn='yes';