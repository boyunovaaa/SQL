SELECT m.pizza_name, p.name AS pizzeria_name
FROM person_order AS po
JOIN menu AS m 
ON po.menu_id = m.id
JOIN pizzeria AS p 
ON m.pizzeria_id = p.id
WHERE po.person_id IN (
SELECT id 
FROM person 
WHERE name = 'Denis' OR name = 'Anna')
ORDER BY m.pizza_name, p.name;