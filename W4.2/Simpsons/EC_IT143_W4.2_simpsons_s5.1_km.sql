-- Q: What is the total Planet Express purchase amount for each family member?

-- A: Join the family-member table to the Planet Express purchase table, then add the purchase amounts for each family member.

SELECT v.Member_ID
     , v.member_name
     , v.total_purchase_amount
INTO dbo.t_simpsons_total_purchases_by_member
FROM dbo.v_simpsons_total_purchases_by_member AS v;