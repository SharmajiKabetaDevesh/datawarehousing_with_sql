-- the first if part checks if the table exists if yes then delete it and recreates it afterwards 



INSERT INTO SILVER.CRM_CUST_INFO (
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date
)
SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
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
FROM(
SELECT * , 
ROW_NUMBER() OVER (PARTITION BY cst_id order by cst_create_date desc) as flag
from Bronze.crm_cust_info
WHERE CST_ID  IS NOT NULL
)t where flag=1 


SELECT * FROM Silver.crm_cust_info