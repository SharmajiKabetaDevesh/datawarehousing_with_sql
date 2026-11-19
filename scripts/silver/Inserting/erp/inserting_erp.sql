TRUNCATE TABLE silver.erp_cust_az12;
GO

INSERT inTO silver.erp_cust_az12(
cid,
bdate,
gen)
SELECT SUBSTRING(cid,4,LEN(cid)) cid,
bdate,
CASE when gen='F' or gen ='Female' THEN 'FEMALE'
WHEN gen='M' or gen ='Male' THEN 'MALE'
ELSE 'N/A'
END as gen
FROM  bronze.erp_cust_az12
where bdate between  '1924-01-01' and GETDATE()


-------


TRUNCATE TABLE silver.erp_px_cat_g1v2;
GO
INSERT INTO silver.erp_px_cat_g1v2(
id,cat,subcat,maintenance
)
select * from bronze.erp_px_cat_g1v2;