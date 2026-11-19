TRUNCATE TABLE silver.crm_prd_info; 
INSERT INTO Silver.crm_prd_info(
  prd_id       ,
    cat_id    ,
    prd_key     ,
    prd_nm       ,
    prd_cost     ,
    prd_line     ,
    prd_start_dt ,
    prd_end_dt   	
)
select 
prd_id,
REPLACE(SUBSTRING(prd_key,1,5),'-','_' )as cat_id,
SUBSTRING(prd_key,7,LEN(prd_key))as prd_key,
prd_nm,
ISNULL(prd_cost,0)as prd_cost,
CASE prd_line
WHEN 'R' THEN 'ROAD'
WHEN 'S' THEN 'SPORT'
WHEN 'M' THEN 'MOUNTAIN'
WHEN 'T' THEN 'TOURING'
END as prd_line,
CAST(prd_start_dt as DATE) as prd_start_dt,
CAST(lead(prd_start_dt)over(partition by prd_key order by prd_start_dt)-1 as DATE)as prd_end_dt
FROM bronze.crm_prd_info

