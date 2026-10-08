USE EC_IT143_DA;
GO
SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS adhoc_first_name,
       dbo.ufn_get_first_name(ContactName) AS udf_first_name
FROM dbo.t_w3_schools_customers;