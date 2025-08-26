
----------Creating CRM Customer Table-----------
IF OBJECT_ID('bronze.crm_cust_id','U') IS NOT NULL
DROP TABLE bronze.crm_cust_id;
GO

CREATE TABLE bronze.crm_cust_id(
cst_id				INT,
cst_key				VARCHAR(50),
cst_firstname		VARCHAR(50),
cst_lastname		VARCHAR(50),
cst_marital_status	VARCHAR(5),
cst_gndr			VARCHAR(5),
cst_create_date		DATE
)
GO

PRINT('------------------------------------------')
PRINT('-----------CRM Customer Table Created-------------')
PRINT('------------------------------------------')

-------------------------Creating CRM Product Table---------------------
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info(
prd_id			INT,
prd_key			VARCHAR(50),
prd_nm			VARCHAR(50),
prd_cost		INT,
prd_line		VARCHAR(5),
prd_start_dt	DATETIME,
prd_end_dt		DATETIME
)
GO

PRINT('------------------------------------------')
PRINT('-----------CRM Product Table Created-------------')
PRINT('------------------------------------------')


-------------------------Creating CRM Product Table---------------------

IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details(
sls_ord_num			VARCHAR(50),
sls_prd_key			VARCHAR(50),
sls_cust_id			INT,
sls_ship_dt			INT,
sls_due_dt			INT,
sls_sales			INT,
sls_quantity		INT,
sls_price			INT
)
GO

PRINT('------------------------------------------')
PRINT('-----------CRM Sales Table Created-------------')
PRINT('------------------------------------------')



-------------------------Creating ERP CUST_AZ12 Table---------------------

IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12(
cid					VARCHAR(50),
bdate				DATE,
gen					VARCHAR(5)
)
GO

PRINT('------------------------------------------')
PRINT('-----------ERP CUST_AZ12 Table Created-------------')
PRINT('------------------------------------------')

-------------------------Creating ERP LOC_A101 Table---------------------

IF OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101(
cid					VARCHAR(50),
cntry				VARCHAR(5)
)
GO

PRINT('------------------------------------------')
PRINT('-----------ERP LOC_A101 Table Created-------------')
PRINT('------------------------------------------')

-------------------------Creating ERP PX_CAT_G1V2 Table---------------------

IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2(
id					VARCHAR(50),
cat					VARCHAR(50),
subcat				VARCHAR(50),
maintenance			VARCHAR(5)
)
GO

PRINT('------------------------------------------')
PRINT('-----------ERP PX_CAT_G1V2 Table Created -------------')
PRINT('------------------------------------------')