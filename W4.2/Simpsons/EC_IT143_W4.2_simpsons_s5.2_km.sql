DROP TABLE IF EXISTS dbo.t_simpsons_total_purchases_by_member;
GO

CREATE TABLE dbo.t_simpsons_total_purchases_by_member
(
    Member_ID             INT NOT NULL,
    member_name           VARCHAR(100) NOT NULL,
    total_purchase_amount DECIMAL(18, 2) NOT NULL,

    CONSTRAINT PK_t_simpsons_total_purchases_by_member
        PRIMARY KEY CLUSTERED (Member_ID ASC)
);
GO