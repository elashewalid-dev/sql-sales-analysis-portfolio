/*
====================================================
Project : Sales Analysis Portfolio
Report  : Germany Customer Sales Summary
Author  : Walid EL ache
Date    : 2026-08-01

Business Question:
The Regional Sales Manager for Germany wants a
summary of customer performance for Accessories
sales during 2023.

Tables Used:
- Orders
- Customers
- Products
- Employees

Business Logic:
- Only customers from Germany
- Only products in the Accessories category
- Only orders placed during 2023
- Calculate the number of orders
- Calculate the total quantity purchased
- Calculate the total revenue
- Calculate the average order value
- Only include customers with at least 3 orders
- Only include customers whose total revenue exceeds 800
- Sort by highest revenue
- If revenue is equal, sort by customer last name

Output:
- Customer ID
- Customer Full Name
- Number of Orders
- Total Quantity Purchased
- Total Revenue
- Average Order Value
====================================================
*/

SELECT
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(o.OrderID) AS Number_Of_Orders,
    SUM(o.Quantity) AS Total_Quantity_Purchased,
    SUM(o.Sales) AS Total_Revenue,
    AVG(o.Sales) AS Average_Order_Value

FROM Orders AS o

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

LEFT JOIN Employees AS e
    ON o.SalesPersonID = e.EmployeeID

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

WHERE
    c.Country = 'Germany'
    AND YEAR(o.OrderDate) = 2023
    AND p.Category = 'Accessories'

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName

HAVING
    COUNT(o.OrderID) >= 3
    AND SUM(o.Sales) > 800

ORDER BY
    Total_Revenue DESC,
    c.LastName ASC;

/*
====================================================
Result:
Returns customer sales performance for Accessories
in Germany during 2023, including the number of
orders, total quantity purchased, total revenue,
and average order value.

This report helps management identify the highest
value customers in the German market.
====================================================
*/