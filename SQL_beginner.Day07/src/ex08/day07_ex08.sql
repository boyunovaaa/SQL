SELECT p.address, pz.name, COUNT(*) AS count_of_orders
FROM person_order AS po 
JOIN person AS p ON p.id = po.person_id
JOIN menu ON menu.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = menu.pizzeria_id
GROUP BY p.address, pz.name
ORDER BY address, name;