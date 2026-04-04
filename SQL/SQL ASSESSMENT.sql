drop database tassessment;
create database tassessment;
use tassessment;
CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name_eng VARCHAR(100)
);

CREATE TABLE city (
    id INT PRIMARY KEY,
    city_name VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE customer (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES city(id)
);

INSERT INTO country (id, country_name_eng)
VALUES(1, 'Germany'),
(2, 'Serbia'),
(3, 'Croatia'),
(4, 'United States of America'),
(5, 'Poland'),
(6, 'Spain'),
(7, 'Russia');
SELECT * FROM country;
INSERT INTO city (id, city_name, country_id)
VALUES(1, 'Berlin', 1),
(2, 'Belgrade', 2),
(3, 'Zagreb', 3),
(4, 'New York', 4),
(5, 'Los Angeles', 4),
(6, 'Warsaw', 5);
SELECT * FROM city;

INSERT INTO customer (id, customer_name, city_id)
VALUES(1, 'Jewelry Store', 4),
(2, 'Bakery', 1),
(3, 'Cafe', 1),
(4, 'Restaurant', 3);
SELECT * FROM customer;
#Task : 1 (join multiple tables using left join)

SELECT 
    c.country_name_eng AS country,
    ct.city_name AS city,
    cu.customer_name AS customer
FROM country c
LEFT JOIN city ct 
    ON c.id = ct.country_id
LEFT JOIN customer cu 
    ON ct.id = cu.city_id
ORDER BY c.country_name_eng;
#Task : 2 (join multiple tables using both left and inner join)
SELECT 
    c.country_name_eng AS country,
    ct.city_name AS city,
    cu.customer_name AS customer
FROM country c
INNER JOIN city ct 
    ON c.id = ct.country_id
LEFT JOIN customer cu 
    ON ct.id = cu.city_id
ORDER BY c.country_name_eng, ct.city_name;