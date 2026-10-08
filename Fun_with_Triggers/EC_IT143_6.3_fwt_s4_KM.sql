/*
Name: Kayega Musa
Course: EC IT143
Assignment: 6.3 Fun with Triggers, Step 4
Database: EC_IT143_DA
Description: After-update trigger that stamps the last modified date.
*/
USE EC_IT143_DA;
GO

CREATE OR ALTER TRIGGER dbo.trg_t_w3_schools_customers_last_modified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE c
    SET last_modified_date = SYSDATETIME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i ON i.CustomerID = c.CustomerID;
END;
GO