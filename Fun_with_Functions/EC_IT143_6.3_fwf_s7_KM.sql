USE EC_IT143_DA;
GO
WITH adhoc AS
(
    SELECT CustomerID,
           LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS first_name
    FROM dbo.t_w3_schools_customers
)
SELECT c.CustomerID, a.first_name, dbo.ufn_get_first_name(c.ContactName) AS udf_name
FROM dbo.t_w3_schools_customers AS c
INNER JOIN adhoc AS a ON a.CustomerID = c.CustomerID
WHERE ISNULL(a.first_name, '') <> ISNULL(dbo.ufn_get_first_name(c.ContactName), '');