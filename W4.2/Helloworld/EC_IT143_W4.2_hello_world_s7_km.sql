CREATE PROCEDURE dbo.usp_hello_world_load
AS

/*
NAME:       dbo.usp_hello_world_load
PURPOSE:    Hello World - Load user stored procedure

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143

NOTES:
This stored procedure reloads the Hello World table from the view
and then displays the results.
*/

BEGIN

    -- 1) Reload data

    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world
        SELECT v.my_message
             , v.current_date_time
        FROM dbo.v_hello_world_load AS v;

    -- 2) Review results

    SELECT t.*
    FROM dbo.t_hello_world AS t;

END;
GO