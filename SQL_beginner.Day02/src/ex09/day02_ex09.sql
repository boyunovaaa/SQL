SELECT name
FROM person AS p
WHERE p.gender = 'female'
AND p.id IN (
SELECT person_id FROM person_order AS po
JOIN menu AS m ON po.menu_id = m.id
WHERE m.pizza_name = 'pepperoni pizza')
AND p.id IN (
SELECT person_id FROM person_order AS po
JOIN menu AS m ON po.menu_id = m.id
WHERE m.pizza_name = 'cheese pizza')
ORDER BY name;