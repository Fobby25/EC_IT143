USE [EC_IT143_DA];
GO

DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS

/*
NAME:       dbo.v_hello_world_load
PURPOSE:    Create the Hello World load view

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143

NOTES:
This script creates a reusable view containing the Hello World message
and the current date and time.
*/

SELECT 'Hello World' AS my_message
     , GETDATE() AS current_date_time;
GO