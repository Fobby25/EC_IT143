-- Q: How many players are on each team?

-- A: Join the player table to the team table, then count the players for each team.

EXEC dbo.usp_soccer_player_count_by_team_load;