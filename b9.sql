CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE OrderDetail (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

SELECT p.name AS product_name,
       SUM(p.price * od.quantity) AS total_sales
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.name;

SELECT category,
       AVG(price * quantity) AS avg_revenue
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY category;

SELECT category,
       AVG(price * quantity) AS avg_revenue
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY category
HAVING AVG(price * quantity) > 20000000;

SELECT name
FROM Product
WHERE id IN (
    SELECT product_id
    FROM OrderDetail
    GROUP BY product_id
    HAVING SUM(quantity * (SELECT price FROM Product WHERE id = product_id))
           >
           (SELECT AVG(t.total_sales)
            FROM (
                SELECT SUM(p.price * od.quantity) AS total_sales
                FROM Product p
                JOIN OrderDetail od ON p.id = od.product_id
                GROUP BY p.id
            ) t)
);

SELECT p.name,
       COALESCE(SUM(od.quantity), 0) AS total_quantity
FROM Product p
LEFT JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.name
ORDER BY p.name;
