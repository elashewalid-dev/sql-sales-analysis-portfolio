/*
====================================================
Project : Sales Analysis Portfolio
Report  : Top Products by Revenue
Author  : Walid El ache 
Date    : 2026-08-01

Business Question:
The Product Manager wants to identify the
best-selling products in the USA during 2023.

Tables Used:
- Products
- Orders
- Customers

Business Logic:
- Only orders placed during 2023
- Only customers from the USA
- Calculate the number of orders for each product
- Calculate the total quantity sold
- Calculate the total revenue
- Calculate the average sale value
- Only include products that sold more than
  50 units
- Only include products that generated more
  than 5,000 in revenue
- Sort by highest revenue
- If revenue is tied, sort by highest quantity sold

Output:
- Product ID
- Product Name
- Product Category
- Number of Orders
- Total Quantity Sold
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    p.ProductID,
    p.Product AS ProductName,
    p.Category,
    COUNT(o.OrderID) AS NumberOfOrders,
    SUM(o.Quantity) AS TotalQuantity,
    SUM(o.Sales) AS TotalRevenue,
    AVG(o.Sales) AS AverageSaleValue

FROM Products AS p

LEFT JOIN Orders AS o
    ON p.ProductID = o.ProductID

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

WHERE
    YEAR(o.OrderDate) = 2023
    AND c.Country = 'USA'

GROUP BY
    p.ProductID,
    p.Product,
    p.Category

HAVING
    SUM(o.Quantity) > 50
    AND SUM(o.Sales) > 5000

ORDER BY
    TotalRevenue DESC,
    TotalQuantity DESC;

/*
====================================================
Result:
Returns the best-selling products in the USA
during 2023, including the number of orders,
total quantity sold, total revenue generated,
and average sale value.

This report helps the Product Manager identify
high-performing products and evaluate product
sales performance in the U.S. market.
====================================================
*/