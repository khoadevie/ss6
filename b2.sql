CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
('Nguyen Van An', 'IT', 8000000, '2023-02-10'),
('Tran Thi Bich', 'HR', 5500000, '2022-11-15'),
('Le Hoang Nam', 'IT', 9000000, '2023-05-20'),
('Pham Minh Anh', 'Finance', 4500000, '2021-09-01'),
('Vo Thi Lan', 'Marketing', 7000000, '2023-03-12'),
('Do Van Khanh', 'IT', 6000000, '2023-07-18');

UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';

DELETE FROM Employee
WHERE salary < 6000000;

SELECT *
FROM Employee
WHERE full_name ILIKE '%an%';

SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';
