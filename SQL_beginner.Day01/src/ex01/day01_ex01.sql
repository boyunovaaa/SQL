SELECT object_name
FROM (
    SELECT name AS object_name, 1 AS sort_order FROM person
    UNION ALL
    SELECT pizza_name, 2 AS sort_order FROM menu
) AS sort
ORDER BY sort_order, object_name;