/*
====================================================
Project : Sales Analysis Portfolio
Report  : Average Sale by Employee
Author  : Walid El ache
Date    : 2026-08-01

Business Question:
The Sales Director wants to evaluate employee
performance based on Clothing sales in Canada
during 2023.

Tables Used:
- Orders
- Customers
- Employees
- Products

Business Logic:
- Only orders placed during 2023
- Only products in the Clothing category
- Only customers from Canada
- Calculate the number of orders handled
- Calculate the number of distinct customers served
- Calculate the total revenue generated
- Calculate the average sale value
- Only include employees who served at least
  5 different customers
- Only include employees whose total revenue
  exceeds 3,000
- Sort by highest revenue
- If revenue is tied, sort by highest average sale value

Output:
- Employee ID
- Employee Full Name
- Number of Orders
- Number of Customers Served
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    COUNT(o.OrderID) AS Number_Of_Orders,
    COUNT(DISTINCT c.CustomerID) AS Number_Of_Customers,
    SUM(o.Sales) AS TotalRevenue,
    AVG(o.Sales) AS AverageSaleValue

FROM Orders AS o

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

LEFT JOIN Employees AS e
    ON o.SalesPersonID = e.EmployeeID

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

WHERE
    YEAR(o.OrderDate) = 2023
    AND p.Category = 'Clothing'
    AND c.Country = 'Canada'

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName

HAVING
    COUNT(DISTINCT c.CustomerID) >= 5
    AND SUM(o.Sales) > 3000

ORDER BY
    TotalRevenue DESC,
    AverageSaleValue DESC;

/*
====================================================
Result:
Returns employee performance for Clothing sales
in Canada during 2023.

The report includes:
- Number of orders handled
- Number of unique customers served
- Total revenue generated
- Average sale value

This report helps management identify the
highest-performing employees based on revenue
and customer reach.
====================================================
*/