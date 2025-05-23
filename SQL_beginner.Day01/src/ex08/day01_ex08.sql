SELECT order_date, CONCAT(name, ' (возраст:', age, ')') AS person_information
FROM person_order
NATURAL JOIN 
(SELECT id AS person_id, name, age FROM person)
ORDER BY order_date, person_information;