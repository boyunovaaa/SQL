WITH visit AS (
    SELECT pz.name, COUNT(*) AS count
	FROM pizzeria AS pz 
	JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
	GROUP BY name
), orders AS (
    SELECT pz.name, COUNT(*) AS count
	FROM pizzeria AS pz 
	JOIN menu AS m ON pz.id = m.pizzeria_id
	JOIN person_order po ON po.menu_id = m.id 
	GROUP BY name
)
SELECT visit.name, COALESCE(visit.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM visit 
FULL JOIN orders ON orders.name = visit.name
ORDER BY total_count DESC, name;