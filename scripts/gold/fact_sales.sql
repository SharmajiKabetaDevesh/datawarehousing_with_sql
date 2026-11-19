
IF OBJECT_ID('gold.fact_sales','V') is not null
	DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales as 
select 
sales.sls_ord_num as order_number,
prd.product_key,
cst.customer_key,
sales.sls_order_dt as order_date,
sales.sls_ship_dt as shipping_date,
sales.sls_due_dt as due_date,
sales.sls_sales as sales_amount,
sales.sls_quantity as quantity,
sales.sls_price as price 

from silver.crm_sales_details as sales
left join gold.dim_products as prd
on sales.sls_prd_key = prd.product_number
left join gold.dim_customers as cst
on sales.sls_cust_id=cst.customer_id