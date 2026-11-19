if object_id ('gold.dim_customers','V') is not null
	DROP VIEW gold.dim_customers
GO

CREATE VIEW gold.dim_customers as 
select 
ROW_NUMBER()over(Order by cst.cst_id) as customer_key,
cst.cst_id as customer_id,
cst.cst_key as customer_number,
cst.cst_firstname as first_name,
cst.cst_lastname as last_name,
cst.cst_marital_status as marital_status,
CASE WHEN (cst.cst_gndr ='N/A' or cst.cst_gndr is NULL) and (az.gen !='N/A' or az.gen is not NULL)  then az.gen
else cst.cst_gndr
END as gender,
loc.cntry as country,
az.bdate as birthdate,

cst.cst_create_date as create_date

from silver.crm_cust_info as cst
left join silver.erp_cust_az12 as az
on cst.cst_key = az.cid
left join silver.erp_loc_a101 as loc
on cst.cst_key = loc.cid
--where cst.cst_gndr is null or  az.gen is null

