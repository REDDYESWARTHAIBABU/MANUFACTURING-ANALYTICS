use dataset;
create table mysql_manufacturing(
Buyer varchar(50), Delivery_period varchar(50), Department_name varchar(100), Designer varchar(50),
Emp_Name varchar(600),  Fiscal_date DATE , Form_type varchar(600), Item_name varchar(100),Machine_Employee varchar(60), Machine_code varchar(60),
Machine_code_emp varchar(60), Machine_name varchar(600), Machine_name_emp varchar(60), Operation_name varchar(600),
user_name varchar(800), WO_DATE DATE , WO_status varchar(60), work_centre_name varchar(600), fiscal_year date,
Manufactured_qty int , processed_qty int, produced_qty int, rejected_qty int, Total_qty int, Total_value double,
WO_qty int );
select count(*) from mysql_manufacturing ;


select * from mysql_manufacturing;

-- 1) Total manufactured quantity

select sum(Manufactured_qty) from mysql_manufacturing;


-- 2) Total rejected quantity

select sum(rejected_qty) from mysql_manufacturing;

-- 3) Total processed quantity

select sum(processed_qty) from mysql_manufacturing;


-- 4) Employee wise rejected quantity

select Emp_Name, sum(rejected_qty) as total_rejected_qty from mysql_manufacturing
group by Emp_Name
order by total_rejected_qty desc
limit 40;


-- 5) Machine wise rejected quantity

select Machine_Employee,sum(rejected_qty) as total_rejected_qty
from mysql_manufacturing
group by Machine_Employee;

-- 6) Production comaprison trend
select day(Fiscal_date),sum(produced_qty) from mysql_manufacturing
group by day(Fiscal_date)
order by day(Fiscal_date) asc;

-- 7) Dept wise manufacture vs rejected
select sum(Manufactured_qty),Department_name from mysql_manufacturing
group by Department_name;

select sum(rejected_qty),Department_name from mysql_manufacturing
group by Department_name;

-- 8) WO  status wise WO quantity
select  sum(WO_qty) ,WO_status from mysql_manufacturing
group by WO_status;
