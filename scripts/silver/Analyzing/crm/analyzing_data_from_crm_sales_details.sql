select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	CAST(CAST(sls_order_dt as VARCHAR) as DATETIME)as sls_order_dt ,
	CAST(CAST(sls_ship_dt AS VARCHAR) AS DATETIME )	as sls_ship_dt,
	CAST(CAST(sls_due_dt as VArchar)AS DATETIME) as sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details

select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_ord_num != TRIM(sls_ord_num)




select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_prd_key != TRIM(sls_prd_key)






select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_order_dt = 0 or sls_order_dt is null


select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_ship_dt = 0 or sls_ship_dt is null



select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_ship_dt = 0 or sls_ship_dt is null


select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	 sls_order_dt ,
	 sls_ship_dt,
	 sls_due_dt	,
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 
where sls_due_dt = 0 or sls_due_dt is null





select 
sls_ord_num	,
	sls_prd_key	,
	sls_cust_id	,
	CASE WHEN sls_order_dt = 0 or len(sls_order_dt ) !=8 THEN NULL
	ELSE CAST(CAST(sls_order_dt as VARCHAR)as DATE) 
	END as sls_order_dt,
	CASE WHEN sls_ship_dt = 0 or len(sls_ship_dt ) !=8 THEN NULL
	ELSE CAST(CAST(sls_ship_dt as VARCHAR)as DATE) 
	END as sls_ship_dt,
	CASE WHEN sls_due_dt = 0 or len(sls_due_dt ) !=8 THEN NULL
	ELSE CAST(CAST(sls_due_dt as VARCHAR)as DATE) 
	END as sls_due_dt,
	
	sls_sales	,
	sls_quantity	,
	sls_price 
from Bronze.crm_sales_details 



Select 
sls_sales,
sls_quantity,
sls_price
from  bronze.crm_sales_details
where sls_sales <=0 or sls_sales is null 
or sls_quantity <=0 or sls_quantity is null 
or sls_price<=0 or sls_price is null


Select 
CASE WHEN sls_sales<=0 or sls_sales is null THEN sls_quantity*ABS(sls_price)
ELSE sls_sales
END as sls_sales,
sls_quantity,
CASE WHEN sls_price is null or sls_price <=0 THEN ROUND(sls_sales/sls_quantity,0)
ELSE sls_price
END  AS sls_price

from  bronze.crm_sales_details