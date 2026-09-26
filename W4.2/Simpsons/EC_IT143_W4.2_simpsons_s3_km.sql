SELECT f.Member_ID
     , f.Name AS member_name
     , CAST(COALESCE(SUM(p.Amount), 0) AS DECIMAL(18, 2)) AS total_purchase_amount
FROM Simpsons.dbo.Family_Data AS f
LEFT JOIN Simpsons.dbo.Planet_Express AS p
    ON p.Card_Member = f.Name
GROUP BY f.Member_ID
       , f.Name
ORDER BY f.Member_ID;