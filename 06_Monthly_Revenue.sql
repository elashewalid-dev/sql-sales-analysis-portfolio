/*
====================================================
Project : Sales Analysis Portfolio
Report  : Monthly Revenue Report
Author  : Walid EL ache
Date    : 2026-08-01

Business Question:
The Finance Manager wants a monthly sales report
for 2023.

Tables Used:
- Orders

Business Logic:
- Only orders placed during 2023
- Calculate the number of orders each month
- Calculate the total quantity sold
- Calculate the total revenue
- Calculate the average sale value
- Only include months where total revenue exceeds 2,000
- Sort from January to December

Output:
- Year
- Month
- Number of Orders
- Total Quantity Sold
- Total Revenue
- Average Sale Value
====================================================
*/

SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    COUNT(OrderID) AS Number_Of_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Revenue,
    AVG(Sales) AS Average_Sale_Value

FROM Orders

WHERE
    YEAR(OrderDate) = 2023

GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)

HAVING
    SUM(Sales) > 2000

ORDER BY
    SalesMonth ASC;

/*
====================================================
Result:
Returns a monthly sales summary for 2023,
including the number of orders, total quantity
sold, total revenue, and average sale value.

This report helps the Finance Manager identify
the strongest sales months and monitor monthly
business performance.
====================================================
*/