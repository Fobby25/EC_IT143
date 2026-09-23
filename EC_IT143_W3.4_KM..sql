/*
Question 8
Original author: Chidimma Nomeh
Question: Using INFORMATION_SCHEMA.TABLES, which tables are classified as
BASE TABLE and belong to the Production schema?
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Production'
    AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;