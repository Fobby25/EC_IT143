-- Q: How many players are on each team?

-- A: Join the player table to the team table, then count the players for each team.

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