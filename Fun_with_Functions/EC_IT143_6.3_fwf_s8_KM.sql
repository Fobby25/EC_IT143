/* Step 8: Next question
How do I get the last name from ContactName? */
USE EC_IT143_DA;
GO

-- Ad hoc query
SELECT ContactName,
       CASE WHEN CHARINDEX(' ', ContactName) = 0 THEN NULL
            ELSE SUBSTRING(ContactName, CHARINDEX(' ', ContactName) + 1, LEN(ContactName))
       END AS last_name
FROM dbo.t_w3_schools_customers;
GO

CREATE OR ALTER FUNCTION dbo.ufn_get_last_name (@full_name NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN CASE WHEN CHARINDEX(' ', @full_name) = 0 THEN NULL
                ELSE SUBSTRING(@full_name, CHARINDEX(' ', @full_name) + 1, LEN(@full_name))
           END;
END;
GO

-- Compare UDF to ad hoc
SELECT ContactName, dbo.ufn_get_last_name(ContactName) AS udf_last_name
FROM dbo.t_w3_schools_customers;
GO

-- 0 results expected
SELECT ContactName
FROM dbo.t_w3_schools_customers
WHERE ISNULL(dbo.ufn_get_last_name(ContactName), '') <>
      ISNULL(CASE WHEN CHARINDEX(' ', ContactName) = 0 THEN NULL
                  ELSE SUBSTRING(ContactName, CHARINDEX(' ', ContactName) + 1, LEN(ContactName)) END, '');
GO