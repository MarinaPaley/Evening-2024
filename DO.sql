DO
$DO$
DECLARE
	message TEXT;
BEGIN
	CALL public."pMakePurshases"(
			productname => 'Киви'
		  , vendorname => NULL
		  , amount => 10
		  , price => 100);
	EXCEPTION
		WHEN OTHERS
		THEN
		GET STACKED DIAGNOSTICS
		message = MESSAGE_TEXT;
		RAISE NOTICE 'Ошибка: %', message;
	END;
$DO$