WITH nm AS (
	SELECT id AS menu_id FROM menu
	EXCEPT
	SELECT menu_id FROM person_order)
SELECT pizza_name, price, pz.name AS pizzeria_name
FROM menu AS m
JOIN nm ON nm.menu_id = m.id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
ORDER BY pizza_name, price;