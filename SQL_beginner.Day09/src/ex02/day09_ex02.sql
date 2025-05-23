CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$trg_person_delete_audit$
BEGIN
	IF (TG_OP = 'DELETE') THEN 
		INSERT INTO person_audit VALUES (
		CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D',
		OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	END IF;
	RETURN NULL;
END;
$trg_person_delete_audit$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE
ON person 
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

-- SELECT * FROM person_audit;