/*
====================================================
Project : Sales Analysis Portfolio
Report  : Customer Order Count
Author  : Walid EL ache
Date    : 2026-08-01

Business Question:
The Customer Success Manager wants to identify the
most active customers based on their order history
during 2023.

Tables Used:
- Orders
- Customers

Business Logic:
- Only orders placed during 2023
- Calculate the total number of orders for each customer
- Calculate the total revenue generated
- Calculate the average sale value
- Only include customers who placed at least 5 orders
- Only include customers whose total revenue exceeds 1,500
- Sort by the highest number of orders
- If two customers have the same number of orders,
  sort by highest revenue

Output:
- Customer ID
- Customer Full Name
- Country
- Number of Orders
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    COUNT(o.OrderID) AS Number_Of_Orders,
    SUM(o.Sales) AS Total_Revenue,
    AVG(o.Sales) AS Average_Sale_Value

FROM Orders AS o

LEFT JOIN Customers AS c
    ON o.CustomerID = c.CustomerID

WHERE
    YEAR(o.OrderDate) = 2023

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Country

HAVING
    COUNT(o.OrderID) >= 5
    AND SUM(o.Sales) > 1500

ORDER BY
    Number_Of_Orders DESC,
    Total_Revenue DESC;

/*
====================================================
Result:
Returns the most active customers during 2023,
including the number of orders they placed,
their total revenue, and their average sale value.

This report helps management identify loyal,
high-value customers based on purchasing activity.
====================================================
*/