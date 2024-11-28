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
	message TEXT;
BEGIN
	CALL public."pCheckEntityName"(product, 'продукта');
	CALL public."pCheckEntityName"(vendor, 'поставщика');
	CALL public."pCheckAboveZero"(amount, 'количество');
	CALL public."pCheckAboveZero"(price, 'цена');

	SELECT * INTO id_product FROM public."fGetProductID"(product);
	message = 'Не найден продукт ' || product;
	CALL public."pCheckID"(id_product, message);

	SELECT * INTO id_vendor FROM public."fGetVendorID"(vendor);
	message = 'Не найден поставщик ' || vendor;
	CALL public."pCheckID"(id_vendor, message);
	
	SELECT * INTO id FROM public."fGetItemID"(id_product, id_vendor);
	message = 'Не найден товар ' || product || ' у поставщика ' || vendor;
	CALL public."pCheckID"(id, message);

	CALL public."pCheckAmount"(id_product, id_vendor, amount);

	SELECT * INTO id FROM public."fGetNextPurchasesID"();

	INSERT INTO "Purchases"("ID", "ID_Vendors", "ID_Products", "Amount", "Price", "Date")
	VALUES (id, id_vendor, id_product, amount, price, current_date);
	RAISE NOTICE 'Вставлена строка о покупке ID = % дата = %', id, current_date;
END;
$$
