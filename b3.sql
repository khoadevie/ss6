CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    points INT
);

INSERT INTO Customer (name, email, phone, points) VALUES
('Nguyen Van A', 'a@gmail.com', '0901111111', 120),
('Tran Thi B', NULL, '0902222222', 80),
('Le Van C', 'c@gmail.com', '0903333333', 150),
('Pham Thanh D', 'd@gmail.com', '0904444444', 200),
('Hoang Thi E', 'e@gmail.com', '0905555555', 50),
('Do Van F', 'f@gmail.com', '0906666666', 200),
('Vu Thi G', 'g@gmail.com', '0907777777', 95);

SELECT DISTINCT name FROM Customer;

SELECT * FROM Customer
WHERE email IS NULL;

SELECT *
FROM Customer
ORDER BY points DESC
OFFSET 1
LIMIT 3;

SELECT *
FROM Customer
ORDER BY name DESC;
