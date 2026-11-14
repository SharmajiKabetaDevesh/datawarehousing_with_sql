-- with stored procedure and it can be executed by calling EXEC bronze.load_crm_data

CREATE OR ALTER PROCEDURE bronze.load_crm_data AS
DECLARE @start_time DATETIME, @end_time DATETIME
BEGIN
	BEGIN TRY
	    SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT	bronze.crm_cust_info
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.crm_prd_info;
	

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\prd_info.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR = ',',
		 TABLOCK
		);


		TRUNCATE TABLE bronze.crm_sales_details;
	

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT 'TIME TAKEN TO LOAD  ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
	END TRY
	BEGIN CATCH
	PRINT 'ERROR Cause while loading data for crm tables';
	PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT 'ERROR NUMBER' + CAST ( ERROR_NUMBER() AS NVARCHAR);
	END CATCH

END


-- without a stored procedure
-- TRUNCATE TABLE bronze.crm_cust_info;
-- GO 

-- BULK INSERT	bronze.crm_cust_info
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\cust_info.csv'
-- WITH (
-- FIRSTROW = 2,
-- FIELDTERMINATOR = ',',
-- TABLOCK
-- );

-- TRUNCATE TABLE bronze.crm_prd_info;
-- GO

-- BULK INSERT bronze.crm_prd_info
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\prd_info.csv'
-- WITH (
--  FIRSTROW = 2,
--  FIELDTERMINATOR = ',',
--  TABLOCK
-- );
-- GO

-- TRUNCATE TABLE bronze.crm_sales_details
-- GO

-- BULK INSERT bronze.crm_sales_details
-- FROM 'C:\Users\Devesh\Documents\dwh-prj\01_datasets\source_crm\sales_details.csv'
-- WITH (
-- FIRSTROW = 2,
-- FIELDTERMINATOR = ',',
-- TABLOCK
-- );

-- GO