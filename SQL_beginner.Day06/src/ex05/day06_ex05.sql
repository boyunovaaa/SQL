COMMENT ON TABLE person_discounts IS 
	'Таблица персональных скидок клиентов пиццерий';
COMMENT ON COLUMN person_discounts.id IS 
	'Уникальный идентификатор - первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 
	'Внешний ключ, указывающий на запись о клиенте в таблице "person", для которого применяется скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 
	'Внешний ключ, указывающий на запись о пиццерии в таблице "pizzeria", где действует скидка';
COMMENT ON COLUMN person_discounts.discount IS 
	'Значение скидки для клиента, выраженное в процентах от 0 до 100, применяемое в конкретной пиццерии';


-- SELECT c.relname AS table_name, obj_description(c.oid) AS table_comment,
--     a.attname AS column_name, d.description AS column_comment
-- FROM pg_class c
-- JOIN pg_attribute a ON c.oid = a.attrelid AND a.attnum > 0
-- LEFT JOIN pg_description d ON c.oid = d.objoid AND a.attnum = d.objsubid
-- WHERE c.relname = 'person_discounts'
-- ORDER BY c.oid;