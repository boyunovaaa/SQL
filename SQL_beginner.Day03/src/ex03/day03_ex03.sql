WITH gen_pz AS (
    SELECT gender, pz.name AS pizzeria_name
    FROM person_visits AS pv
    JOIN person AS pr ON pr.id = pv.person_id
    JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
)
(SELECT pizzeria_name FROM gen_pz  WHERE gender = 'female'
EXCEPT ALL
SELECT pizzeria_name FROM gen_pz  WHERE gender = 'male')
UNION ALL
(SELECT pizzeria_name FROM gen_pz WHERE gender = 'male'
EXCEPT ALL
SELECT pizzeria_name FROM gen_pz WHERE gender = 'female')
ORDER BY pizzeria_name;