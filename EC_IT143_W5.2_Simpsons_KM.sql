/*
Name: Kayega Musa
Course: EC IT143
Assignment: W5.2 Final Project: My Communities Analysis—Create Answers
Database: Simpsons

Description:
This script answers four questions about the Simpsons data set. Questions
5, 6 and 8 were written by Kayega Musa and Question 7 by Jared Barnes.

Estimated runtime: Less than one minute.
*/

USE Simpsons;
GO


/*
Question 5
Original author: Kayega Musa
Question: Which family member has the highest total Planet Express
spending, and which spending categories account for that amount?
*/

WITH TopMember AS
(
    SELECT TOP 1
        Card_Member,
        SUM(Amount) AS total_spent
    FROM Planet_Express
    GROUP BY Card_Member
    ORDER BY total_spent DESC
)
SELECT
    fd.Name,
    pe.Category,
    SUM(pe.Amount) AS category_total,
    tm.total_spent
FROM TopMember AS tm
INNER JOIN Planet_Express AS pe
    ON pe.Card_Member = tm.Card_Member
INNER JOIN Family_Data AS fd
    ON fd.Name = pe.Card_Member
GROUP BY
    fd.Name,
    pe.Category,
    tm.total_spent
ORDER BY category_total DESC;
GO


/*
Question 6
Original author: Kayega Musa
Question: Which family member has the highest total debit amount and
total credit amount in the FBS Visa Costmo transactions?
Note: Credit values are stored as negative numbers, so credit_rank is based
on the size of the credit amount (most negative = largest credit = rank 1).
*/

SELECT
    fd.Name,
    SUM(ISNULL(v.Debit, 0))  AS total_debit,
    SUM(ISNULL(v.Credit, 0)) AS total_credit,
    RANK() OVER (ORDER BY SUM(ISNULL(v.Debit, 0)) DESC) AS debit_rank,
    RANK() OVER (ORDER BY SUM(ISNULL(v.Credit, 0)) ASC) AS credit_rank
FROM Family_Data AS fd
INNER JOIN FBS_Viza_Costmo AS v
    ON fd.Name = v.Member_Name
GROUP BY fd.Name
ORDER BY debit_rank;
GO


/*
Question 7
Original author: Jared Barnes
Question: We want to compare the ages of those who use FBS_Viza_Costmo to the
amount of debit and credit they have. Ordered by highest sum of credit and
debit, what is the birth date and member name of these individuals?
*/

SELECT
    fd.Name AS member_name,
    fd.Birth_Date,
    DATEDIFF(YEAR, fd.Birth_Date, GETDATE()) AS approx_age,
    SUM(ISNULL(v.Debit, 0))  AS total_debit,
    SUM(ISNULL(v.Credit, 0)) AS total_credit,
    SUM(ISNULL(v.Debit, 0)) + SUM(ISNULL(v.Credit, 0)) AS total_debit_plus_credit
FROM Family_Data AS fd
INNER JOIN FBS_Viza_Costmo AS v
    ON fd.Name = v.Member_Name
GROUP BY
    fd.Name,
    fd.Birth_Date
ORDER BY total_debit_plus_credit DESC;
GO


/*
Question 8
Original author: Kayega Musa
Question: How does total Planet Express spending differ by department
and job title?
*/

SELECT
    fd.Department,
    fd.Job_Title,
    SUM(pe.Amount) AS total_spending
FROM Planet_Express AS pe
INNER JOIN Family_Data AS fd
    ON fd.Name = pe.Card_Member
GROUP BY
    fd.Department,
    fd.Job_Title
ORDER BY total_spending DESC;
GO