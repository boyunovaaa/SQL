WITH data_range AS (
SELECT '2022-01-01'::date + generate_series(0, 9) AS missing_date)
SELECT missing_date
FROM data_range
LEFT JOIN 
(SELECT visit_date
FROM person_visits
WHERE person_id = 1 OR person_id = 2) AS vd 
ON data_range.missing_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY missing_date;