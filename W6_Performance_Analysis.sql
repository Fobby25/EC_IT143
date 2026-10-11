SELECT
    SalesOrderID,
    SalesOrderNumber,
    CreditCardApprovalCode,
    TotalDue
FROM Sales.SalesOrderHeader
WHERE CreditCardApprovalCode = '105041Vi48927';
GO
IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_SalesOrderHeader_CreditCardApprovalCode'
      AND object_id = OBJECT_ID('Sales.SalesOrderHeader')
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_CreditCardApprovalCode
    ON [Sales].[SalesOrderHeader] ([CreditCardApprovalCode]);
END;
GO