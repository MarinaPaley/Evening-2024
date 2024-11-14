--DROP PROCEDURE public."pMakeStore";
CREATE OR REPLACE PROCEDURE public."pMakePurshasesWithFunctions"(
	  IN product VARCHAR(25)
	, IN vendor VARCHAR(25)
	, IN amount INTEGER
	, IN price DECIMAL)
LANGUAGE plpgsql
AS
$$
DECLARE
	id_product INTEGER;
	id_vendor INTEGER;
	id INTEGER;
	total_amount INTEGER;
BEGIN
	CALL public."pCheckEntityName"(product, 'продукта');
	CALL public."pCheckEntityName"(vendor, 'поставщика');
	CALL public."pCheckAboveZero"(amount, 'количество');
	CALL public."pCheckAboveZero"(price, 'цена');

	SELECT * INTO id_product FROM public."fGetProductID"(product);
	
	IF id_product IS NULL
	THEN
		RAISE EXCEPTION 'Не найден продукт %', product;
	END IF;

	SELECT * INTO id_vendor FROM public."fGetVendorID"(vendor);
	
	IF id_vendor IS NULL
	THEN
		RAISE EXCEPTION 'Не найден поставщик %', vendor;
	END IF;
	
	SELECT * INTO id FROM public."fGetItemID"(id_product, id_vendor);
	IF id IS NULL
	THEN
		RAISE EXCEPTION 'Не найден товар % у поставщика %', product, vendor;
	END IF;

	SELECT * INTO total_amount
	FROM public."fGetItemAmount"(id_product, id_vendor, amount);
	IF total_amount < amount
	THEN
		RAISE EXCEPTION 'Количество товара % меньше заданного %', total_amount, amount;
	END IF;

	SELECT * INTO id FROM public."fGetNextPurchasesID"();

	INSERT INTO "Purchases"("ID", "ID_Vendors", "ID_Products", "Amount", "Price", "Date")
	VALUES (id, id_vendor, id_product, amount, price, current_date);
	RAISE NOTICE 'Вставлена строка о покупке ID = % дата = %', id, current_date;
END;
$$
