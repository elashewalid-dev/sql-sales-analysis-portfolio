/*
====================================================
Project : Sales Analysis Portfolio
Report  : Country Revenue Analysis
Author  : Walid EL ache
Date    : 2026-08-01

Business Question:
The International Sales Director wants to compare
the sales performance of different countries for
Bike products during 2023.

Tables Used:
- Customers
- Orders
- Products

Business Logic:
- Only orders placed during 2023
- Only products in the Bikes category
- Count the number of unique customers
- Count the number of orders
- Calculate the total quantity sold
- Calculate the total revenue
- Calculate the average sale value
- Only include countries whose total revenue
  exceeds 10,000
- Sort by highest revenue
- If revenue is tied, sort by highest number
  of orders

Output:
- Country
- Number of Customers
- Number of Orders
- Total Quantity Sold
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    c.Country,
    COUNT(DISTINCT c.CustomerID) AS NumberOfCustomers,
    COUNT(o.OrderID) AS NumberOfOrders,
    SUM(o.Quantity) AS TotalQuantitySold,
    SUM(o.Sales) AS TotalRevenue,
    AVG(o.Sales) AS AverageSaleValue

FROM Customers AS c

LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID

LEFT JOIN Products AS p
    ON o.ProductID = p.ProductID

WHERE
    YEAR(o.OrderDate) = 2023
    AND p.Category = 'Bikes'

GROUP BY
    c.Country

HAVING
    SUM(o.Sales) > 10000

ORDER BY
    TotalRevenue DESC,
    NumberOfOrders DESC;

/*
====================================================
Result:
Returns the sales performance of each country
for Bike products during 2023.

The report includes:
- Number of unique customers
- Number of orders
- Total quantity sold
- Total revenue
- Average sale value

This report helps management compare country
performance and identify the strongest markets.
====================================================
*/