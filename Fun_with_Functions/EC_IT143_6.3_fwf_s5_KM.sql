/*
Name: Kayega Musa
Course: EC IT143
Assignment: 6.3 Fun with Functions, Step 5
Database: EC_IT143_DA
Description: Scalar function that returns the first name from a full name.
*/
USE EC_IT143_DA;
GO

CREATE OR ALTER FUNCTION dbo.ufn_get_first_name (@full_name NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    -- Text before the first space; the whole value if there is no space
    RETURN LEFT(@full_name, CHARINDEX(' ', @full_name + ' ') - 1);
END;
GO