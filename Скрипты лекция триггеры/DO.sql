DO
$$
DECLARE 
    message TEXT;
BEGIN
   --CALL public."pMakeStoreWithFunctions"('Молоко', 'Петров', 10, 100);
	--CALL public."pCheckEntityName"('', 'продукта');
	--CALL public."pCheckAboveZero"(-10.00, 'количество');
   CALL public."pMakePurshasesWithFunctions"('Молоко', 'Петров', 10, 100);
EXCEPTION
    WHEN OTHERS
    THEN
    GET STACKED DIAGNOSTICS 
    message = MESSAGE_TEXT;
    RAISE NOTICE 'Ошибка! %', message;
END;
$$

SELECT *
FROM "Items" i 

SELECT *
FROM "Purchases" p 

SELECT *
FROM "Stores" s 