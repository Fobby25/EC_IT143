CREATE PROCEDURE dbo.usp_simpsons_total_purchases_by_member_load
AS

/*
NAME:       dbo.usp_simpsons_total_purchases_by_member_load
PURPOSE:    Reload total Planet Express purchases by family member

MODIFICATION LOG:
Ver     Date        Author  Description
1.0     09/26/2026  KM      Built this script for EC IT143
*/

BEGIN

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

END;
GO