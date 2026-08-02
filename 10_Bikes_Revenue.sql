/*
====================================================
Project : Sales Analysis Portfolio
Report  : Bikes Revenue by Employee
Author  : Walid EL ache
Date    : 2026-08-01

Business Question:
The CEO wants a summary of Bike sales performance
across employees during 2023.

Tables Used:
- Orders
- Employees
- Customers
- Products

Business Logic:
- Only orders placed during 2023
- Only products in the Bikes category
- Calculate the number of orders handled
- Calculate the number of unique customers served
- Calculate the total quantity of bikes sold
- Calculate the total revenue generated
- Only include employees who sold more than
  100 bikes
- Only include employees whose total revenue
  exceeds 10,000
- Sort by highest revenue
- If revenue is tied, sort by highest quantity sold

Output:
- Employee ID
- Employee Full Name
- Number of Orders
- Number of Customers Served
- Total Quantity Sold
- Total Revenue
====================================================
*/

SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeFullName,
    COUNT(o.OrderID) AS NumberOfOrders,
    COUNT(DISTINCT c.CustomerID) AS CustomersServed,
    SUM(o.Quantity) AS QuantitySold,
    SUM(o.Sales) AS TotalRevenue

FROM Orders AS o

LEFT JOIN Employees AS e
    ON o.SalesPersonID = e.EmployeeID

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

WHERE
    p.Category = 'Bikes'
    AND YEAR(o.OrderDate) = 2023

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName

HAVING
    SUM(o.Quantity) > 100
    AND SUM(o.Sales) > 10000

ORDER BY
    TotalRevenue DESC,
    QuantitySold DESC;

/*
====================================================
Result:
Returns the performance of employees who sold
Bikes during 2023.

The report includes:
- Number of orders handled
- Number of unique customers served
- Total quantity of bikes sold
- Total revenue generated

This report helps executive management identify
the highest-performing employees based on bike
sales and revenue contribution.
====================================================
*/