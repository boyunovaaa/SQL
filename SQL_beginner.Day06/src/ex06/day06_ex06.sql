CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT count(*) FROM person_discounts));

-- INSERT INTO person_discounts(person_id, pizzeria_id, discount) VALUES (3, 6, 10);
-- SELECT * FROM person_discounts;