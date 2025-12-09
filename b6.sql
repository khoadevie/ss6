SELECT 
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_order_value
FROM Orders;

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY EXTRACT(YEAR FROM order_date)
HAVING SUM(total_amount) > 50000000
ORDER BY order_year;

SELECT *
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;
