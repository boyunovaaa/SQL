CREATE TABLE routes
(
    id SERIAL PRIMARY KEY NOT NULL,
    point1 VARCHAR(10) NOT NULL,
    point2 VARCHAR(10) NOT NULL,
    cost INT NOT NULL
);


INSERT INTO routes
    (point1, point2, cost)
VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('d', 'c', 30),
    ('c', 'd', 30);

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

SELECT * FROM all_routes
	WHERE total_cost = (SELECT MIN(total_cost) FROM all_routes);