-- with stored procedure and it can be executed by calling EXEC bronze.load_erp_data

CREATE OR ALTER PROCEDURE bronze.load_erp_data AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		SET @start_time = GETDATE();
	    TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT	bronze.erp_cust_az12
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\CUST_AZ12.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\LOC_A101.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR = ',',
		 TABLOCK
		);
	

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT 'TOTAL TIME took for execution '+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+ 'seconds';
	END TRY
	BEGIN CATCH
	PRINT 'ERROR Cause while loading data for crm tables';
	PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT 'ERROR NUMBER' + CAST ( ERROR_NUMBER() AS NVARCHAR);
	END CATCH


END

--without stored procedure
-- TRUNCATE TABLE bronze.erp_cust_az12;
-- GO 

-- BULK INSERT	bronze.erp_cust_az12
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\CUST_AZ12.csv'
-- WITH (
-- FIRSTROW = 2,
-- FIELDTERMINATOR = ',',
-- TABLOCK
-- );

-- TRUNCATE TABLE bronze.erp_loc_a101;
-- GO

-- BULK INSERT bronze.erp_loc_a101
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\LOC_A101.csv'
-- WITH (
--  FIRSTROW = 2,
--  FIELDTERMINATOR = ',',
--  TABLOCK
-- );
-- GO

-- TRUNCATE TABLE bronze.erp_px_cat_g1v2;
-- GO

-- BULK INSERT bronze.erp_px_cat_g1v2
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_erp\PX_CAT_G1V2.csv'
-- WITH (
-- FIRSTROW = 2,
-- FIELDTERMINATOR = ',',
-- TABLOCK
-- );

-- GO