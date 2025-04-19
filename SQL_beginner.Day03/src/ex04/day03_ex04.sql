WITH gen_pz AS (
    SELECT p.gender, pz.name AS pizzeria_name
    FROM person_order AS po
    JOIN person AS p ON p.id = po.person_id
	JOIN menu AS m ON m.id = po.menu_id
    JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
)
(SELECT pizzeria_name FROM gen_pz  WHERE gender = 'female'
EXCEPT
SELECT pizzeria_name FROM gen_pz  WHERE gender = 'male')
UNION
(SELECT pizzeria_name FROM gen_pz WHERE gender = 'male'
EXCEPT
SELECT pizzeria_name FROM gen_pz WHERE gender = 'female')
ORDER BY pizzeria_name;