WITH visits AS (
	SELECT pz.name AS pizzeria_name
	FROM pizzeria AS pz
	JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
	JOIN person AS p ON p.id = pv.person_id
	WHERE p.name = 'Andrey'),
	orders AS (
	SELECT pz.name AS pizzeria_name
	FROM pizzeria AS pz
	JOIN menu AS m ON m.pizzeria_id = pz.id
	JOIN person_order AS po ON po.menu_id = m.id
	JOIN person AS p ON p.id = po.person_id
	WHERE p.name = 'Andrey')
SELECT * FROM visits
EXCEPT
SELECT * FROM orders
ORDER BY pizzeria_name;