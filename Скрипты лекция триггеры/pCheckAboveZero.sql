CREATE OR REPLACE PROCEDURE public."pCheckAboveZero"(
	  value DECIMAL
	, message VARCHAR(25))
LANGUAGE plpgsql
AS $$
BEGIN
	IF value <= 0
	THEN
		RAISE EXCEPTION 'Неправильное % %', message, value;
	END IF;
END
$$