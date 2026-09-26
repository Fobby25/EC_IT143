-- Q: What is the total Planet Express purchase amount for each family member?

-- A: Join the family-member table to the Planet Express purchase table, then add the purchase amounts for each family member.

-- 1) Reload data

TRUNCATE TABLE dbo.t_simpsons_total_purchases_by_member;

INSERT INTO dbo.t_simpsons_total_purchases_by_member
(
    Member_ID,
    member_name,
    total_purchase_amount
)
SELECT v.Member_ID
     , v.member_name
     , v.total_purchase_amount
FROM dbo.v_simpsons_total_purchases_by_member AS v;

-- 2) Review results

SELECT t.*
FROM dbo.t_simpsons_total_purchases_by_member AS t
ORDER BY t.Member_ID;