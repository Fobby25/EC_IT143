/* Step 6: Next question
How do I set "last modified by" to the server user? */
USE EC_IT143_DA;
GO

CREATE OR ALTER TRIGGER dbo.trg_t_w3_schools_customers_last_modified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE c
    SET last_modified_date = SYSDATETIME(),
        last_modified_by   = SUSER_NAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i ON i.CustomerID = c.CustomerID;
END;
GO

-- Test
UPDATE dbo.t_w3_schools_customers SET City = City WHERE CustomerID = 1;

SELECT CustomerID, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;