(SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
FROM pizzeria AS pz 
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
FROM pizzeria AS pz 
JOIN menu AS m ON pz.id = m.pizzeria_id
JOIN person_order po ON po.menu_id = m.id 
GROUP BY name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type ASC, count DESC;