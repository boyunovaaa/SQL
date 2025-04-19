SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT pizza_name, name AS pizzeria_name
FROM menu AS m JOIN pizzeria AS pz ON pz.id = m.pizzeria_id;