CREATE TABLE OldCustomers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE NewCustomers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

SELECT name, city
FROM OldCustomers
UNION
SELECT name, city
FROM NewCustomers;

SELECT name, city
FROM OldCustomers
INTERSECT
SELECT name, city
FROM NewCustomers;

SELECT city, COUNT(*) AS total_customers
FROM (
    SELECT name, city FROM OldCustomers
    UNION ALL
    SELECT name, city FROM NewCustomers
) t
GROUP BY city;

SELECT city
FROM (
    SELECT city, COUNT(*) AS total_customers
    FROM (
        SELECT name, city FROM OldCustomers
        UNION ALL
        SELECT name, city FROM NewCustomers
    ) u
    GROUP BY city
) c
WHERE total_customers = (
    SELECT MAX(cnt)
    FROM (
        SELECT city, COUNT(*) AS cnt
        FROM (
            SELECT name, city FROM OldCustomers
            UNION ALL
            SELECT name, city FROM NewCustomers
        ) x
        GROUP BY city
    ) m
);
