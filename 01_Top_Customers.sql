/*
====================================================
Project : Sales Analysis Portfolio
Report  : Top 5 Customers by Revenue
Author  : walid El ache
Date    : 2026-08-01

Business Question:
Find the top 5 customers in the USA who generated
the highest revenue in 2023.

Tables Used:
- Customers
- Orders

Business Logic:
- Only customers from the USA
- Only orders placed in 2023
- Calculate total revenue for each customer
- Count the number of orders for each customer
- Only include customers whose total revenue is greater than 500
- Return the top 5 customers by revenue

Output:
- Customer ID
- Customer Full Name
- Country
- Number of Orders
- Total Revenue
====================================================
*/

SELECT TOP 5
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS FullNameCustomer,
    c.Country,
    COUNT(o.OrderID) AS Number_Of_Orders,
    SUM(o.Sales) AS HighRevenue

FROM Customers AS c

LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID

WHERE YEAR(o.OrderDate) = 2023
  AND c.Country = 'USA'

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Country

HAVING SUM(o.Sales) > 500

ORDER BY HighRevenue DESC;

/*
====================================================
Result:
Returns the five customers from the USA who generated
the highest revenue during 2023, including the number
of orders and total revenue for each customer.
====================================================
*/