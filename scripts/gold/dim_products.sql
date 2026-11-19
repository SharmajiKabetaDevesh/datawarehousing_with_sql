IF OBJECT_ID('dim_products','V')is not null
	DROP VIEW gold.dim_products
GO

CREATE VIEW gold.dim_products as
select 
ROW_NUMBER() over(order by prd.prd_start_dt,prd_id) as product_key,
prd.prd_id as product_id,
prd.prd_key as product_number,
prd.prd_nm  as product_name,
gv.cat as category,
gv.subcat as subcategory,
prd.cat_id as category_id,
gv.maintenance,
prd.prd_cost as product_cost,
prd.prd_line as product_line,
prd_start_dt as start_date
from silver.crm_prd_info as prd

left join silver.erp_px_cat_g1v2 as gv
on prd.cat_id=gv.id
where prd.prd_end_dt is NULL -- filtering out historical data
