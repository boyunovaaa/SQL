insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	bc.name AS currency_name,
	bc.money * COALESCE(t1, t2) AS currency_in_usd
FROM 
(SELECT b.user_id, b.money, c.name, 
	(SELECT rate_to_usd
	FROM currency
	WHERE id = b.currency_id AND updated < b.updated
	ORDER BY updated DESC
	LIMIT 1
	) AS t1, 
	(SELECT rate_to_usd
	FROM currency
	WHERE id = b.currency_id AND updated > b.updated
	ORDER BY updated
	LIMIT 1
	) AS t2
FROM currency AS c
JOIN balance AS b ON c.id = b.currency_id
GROUP BY b.user_id, b.currency_id, b.money, b.updated, c.name) AS bc
LEFT JOIN "user" AS u ON bc.user_id = u.id
ORDER BY name DESC, lastname, currency_name;