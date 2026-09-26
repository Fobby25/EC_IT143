CREATE PROCEDURE dbo.usp_soccer_player_count_by_team_load
AS

/*
NAME:       dbo.usp_soccer_player_count_by_team_load
PURPOSE:    Reload the soccer player count by team table

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143
*/

BEGIN

    -- 1) Reload data

    TRUNCATE TABLE dbo.t_soccer_player_count_by_team;

    INSERT INTO dbo.t_soccer_player_count_by_team
    (
        t_id,
        t_code,
        player_count
    )
    SELECT v.t_id
         , v.t_code
         , v.player_count
    FROM dbo.v_soccer_player_count_by_team AS v;

    -- 2) Review results

    SELECT t.*
    FROM dbo.t_soccer_player_count_by_team AS t
    ORDER BY t.t_id;

END;
GO