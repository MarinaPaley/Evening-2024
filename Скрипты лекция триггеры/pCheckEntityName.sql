CREATE OR REPLACE PROCEDURE public."pCheckEntityName"(
	  entity_name VARCHAR(25)
	, message VARCHAR(25))
LANGUAGE plpgsql
AS $$
BEGIN
	IF entity_name IS NULL OR entity_name = ''
	THEN
		RAISE EXCEPTION 'Неправильное имя %', message;
	END IF;
END
$$