CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);

INSERT INTO Product (name, category, price, stock) VALUES
('Laptop Dell XPS', 'Điện tử', 25000000, 10),
('Chuột Logitech G304', 'Điện tử', 650000, 50),
('Bàn phím Keychron K6', 'Điện tử', 1800000, 20),
('Bình giữ nhiệt Lock&Lock', 'Gia dụng', 350000, 100),
('Nồi cơm điện Sharp', 'Gia dụng', 1200000, 15);

SELECT * FROM Product;

SELECT *
FROM Product
ORDER BY price DESC
LIMIT 3;

SELECT *
FROM Product
WHERE category = 'Điện tử'
  AND price < 10000000;

SELECT *
FROM Product
ORDER BY stock ASC;
