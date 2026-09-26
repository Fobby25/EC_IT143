DROP TABLE IF EXISTS dbo.t_soccer_player_count_by_team;
GO

CREATE TABLE dbo.t_soccer_player_count_by_team
(
    t_id         INT NOT NULL,
    t_code       VARCHAR(10) NOT NULL,
    player_count INT NOT NULL,

    CONSTRAINT PK_t_soccer_player_count_by_team
        PRIMARY KEY CLUSTERED (t_id ASC)
);
GO