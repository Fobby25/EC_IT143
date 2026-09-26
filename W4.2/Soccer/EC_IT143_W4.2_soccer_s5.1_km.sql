-- Q: How many players are on each team?

-- A: Join the player table to the team table, then count the players for each team.

SELECT v.t_id
     , v.t_code
     , v.player_count
INTO dbo.t_soccer_player_count_by_team
FROM dbo.v_soccer_player_count_by_team AS v;