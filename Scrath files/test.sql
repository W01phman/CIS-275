--Jaron Wolph
USE NAMES;

SELECT TOP 50 *
FROM all_data

--Viewer should see data from the all_data table, with every entry in name being "Mary"

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Vendors';
