CREATE OR ALTER VIEW dbo.vw_order_summary AS SELECT o.OrderID,o.CustomerID,c.CustomerName,o.OrderDate,o.Status,SUM(ol.Quantity*ol.UnitPrice) OrderAmount FROM dbo.Orders o JOIN dbo.Customers c ON c.CustomerID=o.CustomerID JOIN dbo.OrderLines ol ON ol.OrderID=o.OrderID GROUP BY o.OrderID,o.CustomerID,c.CustomerName,o.OrderDate,o.Status;
GO
CREATE OR ALTER VIEW dbo.vw_low_stock AS SELECT ProductID,ProductName,UnitPrice,Stock FROM dbo.Products WHERE Stock<10;
GO
CREATE OR ALTER VIEW dbo.vw_low_stock_edit AS SELECT ProductID,ProductName,Stock FROM dbo.Products WHERE Stock<10 WITH CHECK OPTION;
GO
SELECT * FROM dbo.vw_order_summary; SELECT * FROM dbo.vw_low_stock; UPDATE dbo.vw_low_stock_edit SET Stock=7 WHERE ProductID=102; -- setting above 9 through this view fails CHECK OPTION