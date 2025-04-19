SELECT 
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type,
	b.volume,
	COALESCE(c.name, 'not defined') AS currency_name,
	COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
	b.volume * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM (
SELECT user_id, SUM(money) AS volume, type, currency_id
FROM balance
GROUP BY user_id, type, currency_id
) AS b
LEFT JOIN "user" AS u ON b.user_id = u.id
LEFT JOIN (
SELECT id, name, rate_to_usd
FROM currency
WHERE updated = (SELECT MAX(updated) FROM currency WHERE id = currency.id)
) AS c ON b.currency_id = c.id
ORDER BY name DESC, lastname, type;