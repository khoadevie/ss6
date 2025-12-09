SELECT 
    Customer.name,
    SUM(Orders.total_amount) AS total_spent
FROM Customer
JOIN Orders ON Customer.id = Orders.customer_id
GROUP BY Customer.name
ORDER BY total_spent DESC;

SELECT 
    Customer.name,
    SUM(Orders.total_amount) AS total_spent
FROM Customer
JOIN Orders ON Customer.id = Orders.customer_id
GROUP BY Customer.name
HAVING SUM(Orders.total_amount) = (
    SELECT MAX(total_per_customer)
    FROM (
        SELECT SUM(total_amount) AS total_per_customer
        FROM Orders
        GROUP BY customer_id
    ) AS t
);

SELECT 
    Customer.name
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
WHERE Orders.id IS NULL;

SELECT 
    Customer.name,
    SUM(Orders.total_amount) AS total_spent
FROM Customer
JOIN Orders ON Customer.id = Orders.customer_id
GROUP BY Customer.name
HAVING SUM(Orders.total_amount) > (
    SELECT AVG(total_sum)
    FROM (
        SELECT SUM(total_amount) AS total_sum
        FROM Orders
        GROUP BY customer_id
    ) AS t
);
