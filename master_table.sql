SELECT FinalProject.dbo.Orders.OrderID, FinalProject.dbo.Orders.Date,	   FinalProject.dbo.Orders.Quantity, FinalProject.dbo.ProductCategory.CategoryID, 
	   FinalProject.dbo.ProductCategory.CategoryName,FinalProject.dbo.Products.ProdName, 
	   FinalProject.dbo.Products.Price,FinalProject.dbo.Customers.CustomerID, 
	   FinalProject.dbo.Customers.CustomerCity, FinalProject.dbo.Customers.CustomerState,
	   (FinalProject.dbo.Orders.Quantity * FinalProject.dbo.Products.Price) AS total_sales
FROM FinalProject.dbo.ProductCategory
	JOIN (FinalProject.dbo.Products
	JOIN (FinalProject.dbo.Orders
	JOIN FinalProject.dbo.Customers
	ON FinalProject.dbo.Orders.CustomerID = FinalProject.dbo.Customers.CustomerID)
	ON FinalProject.dbo.Orders.ProdNumber = FinalProject.dbo.Products.ProdNumber)
	ON FinalProject.dbo.ProductCategory.CategoryID = FinalProject.dbo.Products.Category
GROUP BY FinalProject.dbo.Orders.OrderID, FinalProject.dbo.Orders.Date, 
	FinalProject.dbo.Customers.CustomerID, FinalProject.dbo.Customers.CustomerCity,
	FinalProject.dbo.Customers.CustomerState,
	FinalProject.dbo.Products.ProdName, FinalProject.dbo.Products.Price, 
	FinalProject.dbo.Orders.Quantity, FinalProject.dbo.ProductCategory.CategoryID,
	FinalProject.dbo.ProductCategory.CategoryName
ORDER BY FinalProject.dbo.Orders.Date ASC;
