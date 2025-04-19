WITH RECURSIVE res AS (
    SELECT point1, point2, cost,
    ARRAY[point2]::VARCHAR(10)[] AS tour, cost AS total_cost
    FROM routes
    WHERE point1 = 'a'

    UNION ALL 

    SELECT r.point1, r.point2, r.cost,
        array_append(res.tour, r.point2)::VARCHAR(10)[],
        res.total_cost + r.cost AS total_cost
    FROM routes AS r
    JOIN res ON res.point2 = r.point1
    WHERE r.point2 != ALL(res.tour) AND r.point1 != 'a'
), all_routes AS (
	SELECT total_cost, (ARRAY['a'] || tour) AS tour FROM res
	WHERE array_length(tour, 1) > 3
	ORDER BY 1, 2
) 

SELECT * FROM all_routes;