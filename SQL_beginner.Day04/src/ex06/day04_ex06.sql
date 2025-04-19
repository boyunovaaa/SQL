CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT name
FROM pizzeria AS p
JOIN person_visits AS pv
ON p.id = pv.pizzeria_id
WHERE pv.person_id = (
SELECT id FROM person WHERE name = 'Dmitriy')
AND pv.visit_date = '2022-01-08'
AND p.id IN (
SELECT pizzeria_id FROM menu WHERE price < 800);

SELECT * FROM mv_dmitriy_visits_and_eats;