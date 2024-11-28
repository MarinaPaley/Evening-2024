DO
$$
DECLARE 
    message TEXT;
	Id INTEGER;
	id_product INTEGER;
	product TEXT;
BEGIN
    --CALL public."pMakeStoreWithFunctions"('Молоко', 'Петров', 10, 100);
	--CALL public."pCheckEntityName"('', 'продукта');
	--CALL public."pCheckAboveZero"(-10.00, 'количество');
	CALL public."pMakePurshasesWithFunctions"('Томаты', 'Иванов', 4, 100);
	
	--product = 'Свёкла';
	--SELECT * INTO id_product FROM public."fGetProductID"(product);
	--message = 'Не найден продукт ' || product;
	--CALL public."pCheckID"(id_product, message);
	--RAISE NOTICE 'Продукт % имеет ID = %', product, id_product;

	--CALL public."pCheckAmount"(1, 1, 3);
	--RAISE NOTICE 'Ok';

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
FROM "Vendors" v 

SELECT *
FROM "Products" p 

SELECT *
FROM "Purchases" p 

SELECT *
FROM "Stores" s 