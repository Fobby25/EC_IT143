DROP VIEW IF EXISTS dbo.v_soccer_player_count_by_team;
GO

CREATE VIEW dbo.v_soccer_player_count_by_team
AS

/*
NAME:       dbo.v_soccer_player_count_by_team
PURPOSE:    Show the number of players on each soccer team

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143
*/

SELECT t.t_id
     , t.t_code
     , COUNT(p.pl_id) AS player_count
FROM MyFC.dbo.tblTeamDim AS t
LEFT JOIN MyFC.dbo.tblPlayerDim AS p
    ON p.t_id = t.t_id
GROUP BY t.t_id
       , t.t_code;
GO