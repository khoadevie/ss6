SELECT 
    Employee.full_name,
    Department.name AS department_name
FROM Employee
INNER JOIN Department ON Employee.department_id = Department.id;

SELECT 
    Department.name AS department_name,
    AVG(Employee.salary) AS avg_salary
FROM Department
INNER JOIN Employee ON Employee.department_id = Department.id
GROUP BY Department.name;

SELECT 
    Department.name AS department_name,
    AVG(Employee.salary) AS avg_salary
FROM Department
INNER JOIN Employee ON Employee.department_id = Department.id
GROUP BY Department.name
HAVING AVG(Employee.salary) > 10000000;

SELECT 
    Department.name AS department_name
FROM Department
LEFT JOIN Employee ON Employee.department_id = Department.id
WHERE Employee.id IS NULL;
