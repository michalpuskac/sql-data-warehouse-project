/*
===========================
Create Database and Schemas
===========================
Script purpose:
    This script create a new databe name 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionaly, 
    the script sets up three schemas whithin the database: 'bronze', 'silver', 'gold'.

WARNING:
    Running the scripts will drop the entire 'DataWarehouse' database if it exists.
    All data will be permanently deleted. 
    Proceed with caution !!! Ensure you have proper backup before running.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
