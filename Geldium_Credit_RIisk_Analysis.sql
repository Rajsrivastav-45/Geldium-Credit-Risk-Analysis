create database credit_risk;
use credit_risk;
select * from customers_dataset;
select  count(distinct Customer_ID) as total_customer from customers_dataset;

Set SQL_SAFE_UPDATES=0;
-- check customer empolyement status
select Employment_Status, count(*) as count
from customers_dataset 
group by Employment_Status;

-- update data 4th standard categories
update customers_dataset
set Employment_Status = case
when lower(Employment_Status) in ('employed' ,'emp') then 'Employed'
when lower(Employment_Status) = 'retired' Then 'Retired'
when lower(Employment_Status) = 'Self-employed' then 'Self_Employed'
else 'Unemployed'
end;

select Customer_ID,Credit_Utilization,Credit_Score,Delinquent_Account
from customers_dataset
where Credit_Utilization > 1.0;
-- update credit_utilization
update customers_dataset
set Credit_Utilization =1.0
where Credit_Utilization > 1.0;

select 
count(*) as total_customers,
round(avg(income),2) as avg_income,
round(avg(Loan_Balance),2) as avg_loan_balance,
round(avg(Credit_Score),2) as avg_credit_score,
sum(Delinquent_Account) as total_Delinquent,
round(avg(Delinquent_Account)* 100,2) as overall_Delinquent_rate_pct
from customers_dataset;
-- delinquency Risk by employment_status
select 
Employment_Status, count(*) as total_customers,
sum(Delinquent_Account) as Delinquent_customers,
round(avg(Delinquent_Account)* 100,2) as Delinquent_rate_pct,
round(avg(income),2) as avg_income
from customers_dataset
group by Employment_Status 
order by Delinquent_rate_pct desc;

-- delinquency Risk by credit card type 
select 
Credit_Card_Type,count(*) as total_customers,
sum(Delinquent_Account) as Delinquent_customers,
round(avg(Delinquent_Account)* 100,2) as Delinquent_rate_pct,
round(avg(income),2) as avg_income
from customers_dataset
group by Credit_Card_Type
order by Delinquent_rate_pct desc;
-- delinquency Risk by Location
select 
Location,count(*) as total_customers,
sum(Delinquent_Account) as Delinquent_customers,
round(avg(Delinquent_Account)* 100,2) as Delinquent_rate_pct,
round(avg(income),2) as avg_income
from customers_dataset
group by Location
order by Delinquent_rate_pct desc;

