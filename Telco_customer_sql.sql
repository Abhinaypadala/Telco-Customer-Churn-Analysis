CREATE DATABASE telco;
USE telco;
select *
from telco_customer;
USE telco;
DROP TABLE IF EXISTS telco_customer;
SELECT * FROM telco_customer LIMIT 5;
ALTER TABLE telco_customer RENAME COLUMN `Churn Flag` TO ChurnFlag;
ALTER TABLE telco_customer RENAME COLUMN `Tenure  Group` TO TenureGroup;
DESCRIBE telco_customer;
ALTER TABLE telco_customer CHANGE `Churn Flag` ChurnFlag INT;

SELECT COUNT(*) FROM telco_customer;

select churnflag,count(*) as churn
from telco_customer
group by churnflag
having churnflag =1;

SELECT COUNT(*) AS churned_customers
FROM telco_customer
WHERE churnflag = 1;
select  customerID,avg(monthlycharges) as average_charges
from telco_customer
group by customerID;

select contract,count(*) as no_of_cust
from telco_customer
group by contract;

select internetservice,round(sum(monthlycharges),2) as month_charges
from telco_customer
group by internetservice;

-- Tenure
SELECT TenureGroup, COUNT(*) AS customers, SUM(ChurnFlag) AS churned,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM telco_customer GROUP BY TenureGroup ORDER BY churn_rate_pct DESC;

-- Internet service
SELECT InternetService, COUNT(*) AS customers, SUM(ChurnFlag) AS churned,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM telco_customer GROUP BY InternetService ORDER BY churn_rate_pct DESC;

-- Payment method
SELECT PaymentMethod, COUNT(*) AS customers, SUM(ChurnFlag) AS churned,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM telco_customer GROUP BY PaymentMethod ORDER BY churn_rate_pct DESC;

-- Tech support
SELECT TechSupport, COUNT(*) AS customers, SUM(ChurnFlag) AS churned,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM telco_customer GROUP BY TechSupport ORDER BY churn_rate_pct DESC;