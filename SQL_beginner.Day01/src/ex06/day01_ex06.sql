SELECT DISTINCT person_order.order_date as action_date, person.name as person_name
FROM person_order
JOIN person_visits ON person_order.person_id = person_visits.person_id
JOIN person ON person.id = person_visits.person_id
WHERE person_visits.visit_date = person_order.order_date
ORDER BY action_date ASC, person_name DESC;