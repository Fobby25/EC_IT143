USE EC_IT143_DA;
GO
SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS first_name
FROM dbo.t_w3_schools_customers;