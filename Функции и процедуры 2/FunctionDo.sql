DO
$DO$
DECLARE
	message TEXT;
BEGIN
	SELECT "fGetSalesOrderHeaderToSalerWithRaise"(lastname => 'Иванов');
	EXCEPTION
		WHEN OTHERS
		THEN
		GET STACKED DIAGNOSTICS
		message = MESSAGE_TEXT;
		RAISE NOTICE 'Ошибка: %', message;
	END;
$DO$