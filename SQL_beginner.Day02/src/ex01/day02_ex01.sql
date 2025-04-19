SELECT missing_date
FROM 
(SELECT '2022-01-01'::date + generate_series(0, 9) AS missing_date) AS date_range
LEFT JOIN 
(SELECT visit_date
FROM person_visits
WHERE person_id = 1 OR person_id = 2) AS visited_dates 
ON date_range.missing_date = visited_dates.visit_date
WHERE visited_dates.visit_date IS NULL
ORDER BY missing_date;