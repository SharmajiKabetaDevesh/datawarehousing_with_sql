-- erp_local-101
select 
REPLACE(cid,'-','') as cid
from bronze.erp_loc_a101
-- removed - from cid column as we wont be able to create a join with it
select * from Bronze.crm_cust_info


select 
 DISTinct (cntry)
from Bronze.erp_loc_a101
--ensruing there is a consitency betn the data
Select distinct cntry
from(
Select 
CASE when cntry = 'DE' THEN 'Germany'
When cntry='US' or cntry ='USA' THEN 'United States'
when cntry is null or cntry='' THEN 'N/A'
ELSE TRIM(cntry)
END as cntry
From Bronze.erp_loc_a101) t


--erp_cust_az
select * from bronze.erp_cust_az12
-- we dont need NAS at the start of CIds as we cwont be able to use it during a join

SELECT SUBSTRING(cid,4,LEN(cid)) cid
FROM  bronze.erp_cust_az12

-- ensuring that the birthday is within the permissible range 
Select * FROM bronze.erp_cust_az12
where bdate < '1924-01-01'

Select * FROM bronze.erp_cust_az12
where bdate > GETDATE()

Select * from Bronze.erp_cust_az12
where bdate between  '1924-01-01' and GETDATE()



--checking out the gender column
Select distinct(gen) from Bronze.erp_cust_az12
-- as the gender column is inconsistent we need to repair things here

Select
CASE when gen='F' or gen ='Female' THEN 'FEMALE'
WHEN gen='M' or gen ='Male' THEN 'MALE'
ELSE 'N/A'
END as gen
from bronze.erp_cust_az12


---------------------------------
select * from bronze.erp_px_cat_g1v2


Select distinct(id)
from bronze.erp_px_cat_g1v2



Select distinct(cat)
from bronze.erp_px_cat_g1v2


Select distinct(subcat)
from bronze.erp_px_cat_g1v2



Select distinct(maintenance)
from bronze.erp_px_cat_g1v2

