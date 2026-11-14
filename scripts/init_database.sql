-- This script creates a database named DataWarehouse  with three schemas as gold ,silver,Bronze
-- the "GO" statement acts as a separator stating complete what is written above first then move down.

USE master;

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO


CREATE SCHEMA Gold;
GO