/*
====================================================
Project : Sales Analysis Portfolio
Report  : Revenue by Product Category
Author  : walid El ache
Date    : 2026-08-01

Business Question:
The Product Manager wants to know how much revenue
each product category generated in Germany during 2023.

Tables Used:
- Orders
- Products
- Customers

Business Logic:
- Only customers from Germany
- Only orders placed in 2023
- Calculate the number of orders
- Calculate the total quantity sold
- Calculate the total revenue
- Calculate the average sale value
- Group the results by product category
- Sort by highest revenue

Output:
- Product Category
- Number of Orders
- Total Quantity Sold
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    p.Category,
    COUNT(o.OrderID) AS Number_Of_Orders,
    SUM(o.Quantity) AS TotalQuantity,
    SUM(o.Sales) AS Total_Revenue,
    AVG(o.Sales) AS AverageSaleValue

FROM Orders AS o

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

WHERE
    c.Country = 'Germany'
    AND YEAR(o.OrderDate) = 2023

GROUP BY
    p.Category

ORDER BY
    Total_Revenue DESC;

/*
====================================================
Result:
Returns the revenue performance of each product
category in Germany during 2023, including the
number of orders, total quantity sold, total
revenue, and average sale value.

This report helps management identify which product
categories perform best in the German market.
====================================================
*/