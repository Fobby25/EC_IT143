DROP VIEW IF EXISTS dbo.v_simpsons_total_purchases_by_member;
GO

CREATE VIEW dbo.v_simpsons_total_purchases_by_member
AS

/*
NAME:       dbo.v_simpsons_total_purchases_by_member
PURPOSE:    Show total Planet Express purchases for each family member

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143
*/

SELECT f.Member_ID
     , f.Name AS member_name
     , CAST(COALESCE(SUM(p.Amount), 0) AS DECIMAL(18, 2)) AS total_purchase_amount
FROM Simpsons.dbo.Family_Data AS f
LEFT JOIN Simpsons.dbo.Planet_Express AS p
    ON p.Card_Member = f.Name
GROUP BY f.Member_ID
       , f.Name;
GO