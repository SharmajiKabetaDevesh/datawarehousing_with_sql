-- finding cst_id which are repeating
Select cst_id, count(cst_id)
from bronze.crm_cust_info
GROUP BY cst_id
HAVING count(cst_id) >1 or cst_id is NULL;

--ensuring there is unique cst_ids only
SELECT * FROM(
SELECT * , 
ROW_NUMBER() OVER (PARTITION BY cst_id order by cst_create_date desc) as flag
from Bronze.crm_cust_info
)t where flag=1;

-- finding out if the firstname consist of any spaces
Select cst_firstname from Bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname);

-- finding out if the lastname consist of any spaces
Select cst_lastname from Bronze.crm_cust_info
where cst_lastname != TRIM(cst_lastname);


--Removing trailing and leading spaces from firstname & last name
Select 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date
from bronze.crm_cust_info;





Select distinct(cst_gndr) from Bronze.crm_cust_info

Select distinct(cst_marital_status) from Bronze.crm_cust_info

Select
cst_id,
cst_key,
cst_firstname,
cst_lastname,
CASE cst_marital_status
WHEN 'S' THEN 'SINGLE'
WHEN 'M' THEN 'MARRIED'
ELSE 'N/A'
end AS cst_marital_status,
CASE 
WHEN cst_gndr= 'M' then 'MALE'
WHEN cst_gndr= 'F' then 'FEMALE'
ELSE 'N/A'
end AS cst_gndr,
cst_create_date

FROM BRONZE.crm_cust_info
