/*
====================================================
Project : Sales Analysis Portfolio
Report  : Top Employees by Revenue
Author  : walid El ache
Date    : 2026-08-01

Business Question:
The Sales Director wants to identify the top-performing
employees who sold Bikes in France during 2023.

Tables Used:
- Orders
- Customers
- Employees
- Products

Business Logic:
- Only customers from France
- Only products in the Bikes category
- Only orders placed in 2023
- Calculate the number of orders handled by each employee
- Calculate the total quantity sold
- Calculate the total revenue generated
- Only include employees whose total revenue is greater than 1,000
- Sort by highest revenue

Output:
- Employee ID
- Employee Full Name
- Number of Orders
- Total Quantity Sold
- Total Revenue
====================================================
*/

SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    COUNT(o.OrderID) AS Number_Of_Orders,
    SUM(o.Quantity) AS Total_Quantity_Sold,
    SUM(o.Sales) AS Total_Revenue

FROM Orders AS o

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

LEFT JOIN Employees AS e
    ON o.SalesPersonID = e.EmployeeID

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

WHERE
    c.Country = 'France'
    AND p.Category = 'Bikes'
    AND YEAR(o.OrderDate) = 2023

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName

HAVING
    SUM(o.Sales) > 1000

ORDER BY
    Total_Revenue DESC;

/*
====================================================
Result:
Returns the top-performing employees who sold Bikes
in France during 2023, including the number of
orders handled, total quantity sold, and total
revenue generated.

This report helps management evaluate employee
performance and identify the highest revenue
contributors in the French market.
====================================================
*/