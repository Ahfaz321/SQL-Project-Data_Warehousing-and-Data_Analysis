
CREATE OR ALTER PROCEDURE Load_Bronze_Layer AS
BEGIN
	DECLARE @start_time DATE, @end_time DATE,@batch_start_time DATE, @batch_end_time DATE
	BEGIN TRY
		------------------Loading Bronze Layer--------------------

		------------------Loading CRM Layer-----------------------

		------------------Loading  Customer Info-------------------
		SET @batch_start_time=GETDATE();
		SET @start_time=GETDATE();
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating CRM Customer Info Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
		SET @end_time = GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In CRM Customer Info Tabel')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')


		--------------------Loading Product tabel------------------------------
		SET @start_time=GETDATE()
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating CRM Product Info Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
        SET @end_time = GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In CRM Product Info Tabel-------------')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')

		------------------Loading Sales Details-----------------------------------
		SET @start_time=GETDATE()
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating CRM Sales Details Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
		SET @end_time = GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In CRM Sales Details Tabel-------------')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')



		---------------Loading ERP Layer--------------------

		---------------Loading CUST AZ12--------------------
		SET @start_time=GETDATE()
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating ERP CUST_AZ12 Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
		SET @end_time = GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In ERP CUST_AZ12 Tabel-------------')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')


		--------------------Loading LOC_A101-----------------------------
		SET @start_time=GETDATE()
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating ERP LOC_A101 Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.erp_Loc_a101;

		BULK INSERT bronze.erp_Loc_a101
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
		SET @end_time = GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In ERP LOC_A101 Tabel-------------')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')

		--------------------Loading PX_CAT_G1V2---------------------
		SET @start_time=GETDATE()
		PRINT('-------------------------------------------------------------')
		PRINT('Truncating ERP PX_CAT_G1V2 Details Tabel-------------')
		PRINT('-------------------------------------------------------------')
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'E:\Data Analytics\Course Material\SQL\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK)
		SET @end_time = GETDATE()
		SET @batch_end_time=GETDATE()
		PRINT('--------------------------------------------------------------------')
		PRINT('DATA inserted In ERP Details Tabel-------------')
		PRINT('Time Taken To Excute '+ CAST(DATEDIFF(second,@start_time,@end_time) AS VARCHAR))
		PRINT('--------------------------------------------------------------------')
		PRINT('=========================================================================')
		PRINT('Time Taken To Excute This Batch '+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS VARCHAR))
		PRINT('==========================================================================')

		--Select *from bronze.erp_loc_a101

		--Select count(*) from bronze.erp_loc_a101 group by cid

		--alter table bronze.erp_loc_a101 alter column cntry varchar(50)

		--Select *from bronze.sales_details

		-- yo your error handling code goes here

	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END

exec Load_Bronze_Layer

--my NAMES--