USE EC_IT143_DA;
GO
UPDATE dbo.t_w3_schools_customers
SET City = City
WHERE CustomerID = 1;

SELECT CustomerID, City, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;