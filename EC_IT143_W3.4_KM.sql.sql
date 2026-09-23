/*
Question 7
Original author: Chidimma Nomeh
Question: Which tables in the AdventureWorks database contain a column named
ModifiedDate according to the INFORMATION_SCHEMA.COLUMNS view?
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ModifiedDate'
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;