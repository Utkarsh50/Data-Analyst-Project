-- Section 1: Exploratory Analysis
-- Q: Data type of all columns in the "customers" table
-- (Run via BigQuery UI schema tab, or query INFORMATION_SCHEMA as below)

SELECT column_name, data_type, is_nullable
FROM `Target.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'customers';
