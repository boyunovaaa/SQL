CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pz.name AS pizzeria_name 
    FROM pizzeria AS pz
    JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
    JOIN menu ON menu.pizzeria_id = pz.id
    JOIN person AS p ON p.id = pv.person_id
    WHERE p.name = pperson AND price < pprice AND visit_date = pdate;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');