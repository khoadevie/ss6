CREATE TABLE Course (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    instructor VARCHAR(50),
    price NUMERIC(10,2),
    duration INT
);

INSERT INTO Course (title, instructor, price, duration) VALUES
('SQL Cơ Bản', 'Nguyen An', 800000, 25),
('Lập trình Java', 'Tran Binh', 1500000, 40),
('Web Frontend', 'Le Cuong', 1200000, 35),
('Python Phân Tích Dữ Liệu', 'Pham Dung', 2000000, 45),
('Demo Khóa Học', 'Hoang Nam', 500000, 10),
('SQL Nâng Cao', 'Vo Lan', 1800000, 50);

UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

DELETE FROM Course
WHERE title ILIKE '%demo%';

SELECT *
FROM Course
WHERE title ILIKE '%sql%';

SELECT *
FROM Course
WHERE price BETWEEN 500000 AND 2000000
ORDER BY price DESC
LIMIT 3;
