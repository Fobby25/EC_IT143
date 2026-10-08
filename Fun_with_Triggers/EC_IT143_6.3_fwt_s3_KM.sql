/* Step 3: Research
Source: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql */
USE EC_IT143_DA;
GO
ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_date DATETIME2 NULL,
        last_modified_by   NVARCHAR(128) NULL;
GO