SELECT t.t_id
     , t.t_code
     , COUNT(p.pl_id) AS player_count
FROM MyFC.dbo.tblTeamDim AS t
LEFT JOIN MyFC.dbo.tblPlayerDim AS p
    ON p.t_id = t.t_id
GROUP BY t.t_id
       , t.t_code
ORDER BY t.t_id;