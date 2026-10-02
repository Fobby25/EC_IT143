/*
Name: Kayega Musa
Course: EC IT143
Assignment: W5.2 Final Project: My Communities Analysis—Create Answers
Database: MyFC

Description:
This script answers four questions about the MyFC data set. Questions 1-3
were written by Kayega Musa and Question 4 by Victor David Sarkibaka.

Estimated runtime: Less than one minute.
*/

USE MyFC;
GO


/*
Question 1
Original author: Kayega Musa
Question: Which team has the highest total month-to-date player salary,
and how many players contribute to that total?
Note: Uses the most recent as_of_date so months are not added together.
*/

WITH LatestFact AS
(
    SELECT pl_id, mtd_salary
    FROM tblPlayerFact
    WHERE as_of_date = (SELECT MAX(as_of_date) FROM tblPlayerFact)
)
SELECT TOP 1 WITH TIES
    t.t_code,
    SUM(f.mtd_salary)       AS total_mtd_salary,
    COUNT(DISTINCT p.pl_id) AS player_count
FROM LatestFact AS f
INNER JOIN tblPlayerDim AS p
    ON f.pl_id = p.pl_id
INNER JOIN tblTeamDim AS t
    ON p.t_id = t.t_id
GROUP BY t.t_code
ORDER BY total_mtd_salary DESC;
GO


/*
Question 2
Original author: Kayega Musa
Question: Which player position has the highest average month-to-date
salary across the club?
Note: Uses the most recent as_of_date.
*/

WITH LatestFact AS
(
    SELECT pl_id, mtd_salary
    FROM tblPlayerFact
    WHERE as_of_date = (SELECT MAX(as_of_date) FROM tblPlayerFact)
)
SELECT TOP 1 WITH TIES
    pos.p_name,
    AVG(f.mtd_salary) AS avg_mtd_salary
FROM LatestFact AS f
INNER JOIN tblPlayerDim AS p
    ON f.pl_id = p.pl_id
INNER JOIN tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY pos.p_name
ORDER BY avg_mtd_salary DESC;
GO


/*
Question 3
Original author: Kayega Musa
Question: How many players are assigned to each team and position
combination?
*/

SELECT
    t.t_code,
    pos.p_name,
    COUNT(DISTINCT p.pl_id) AS player_count
FROM tblPlayerDim AS p
INNER JOIN tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY
    t.t_code,
    pos.p_name
ORDER BY
    t.t_code,
    pos.p_name;
GO


/*
Question 4
Original author: Victor David Sarkibaka
Question: For the most recent as_of_date in tblPlayerFact, what is the total
mtd_salary per team, broken down by position (p_name)? Are certain positions
consistently the highest-paid across teams, or does it vary team by team?
Note: as_of_date is stored as text, so MAX() assumes it sorts chronologically.
rank_within_team = 1 marks the highest-paid position on each team.
*/

WITH LatestFact AS
(
    SELECT pl_id, mtd_salary
    FROM tblPlayerFact
    WHERE as_of_date = (SELECT MAX(as_of_date) FROM tblPlayerFact)
)
SELECT
    t.t_code,
    pos.p_name,
    SUM(f.mtd_salary) AS total_mtd_salary,
    RANK() OVER (PARTITION BY t.t_code
                 ORDER BY SUM(f.mtd_salary) DESC) AS rank_within_team
FROM LatestFact AS f
INNER JOIN tblPlayerDim AS p
    ON f.pl_id = p.pl_id
INNER JOIN tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY
    t.t_code,
    pos.p_name
ORDER BY
    t.t_code,
    rank_within_team;
GO