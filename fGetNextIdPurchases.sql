CREATE FUNCTION public."fGetNextIdPurchases"()
RETURNS INT 
LANGUAGE plpgsql
AS
$$
DECLARE
	id INT;
BEGIN
	SELECT MAX("ID")
	INTO id
	FROM "Purchases";
---- если таблица таблица пустая, то id = NULL
    IF id IS NULL
    	THEN id = 1;
    ELSE id = id + 1;
    END IF;
   
   RETURN id;
END;
$$