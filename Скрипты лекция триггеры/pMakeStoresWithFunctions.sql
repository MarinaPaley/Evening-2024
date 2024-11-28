--DROP PROCEDURE public."pMakeStore";
CREATE OR REPLACE PROCEDURE public."pMakeStoreWithFunctions"(
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

	SELECT * INTO id FROM public."fGetNextStoreID"();

	INSERT INTO "Stores"("ID", "ID_Vendors", "ID_Products", "Amount", "Price", "Date")
	VALUES (id, id_vendor, id_product, amount, price, current_date);
	RAISE NOTICE 'Вставлена строка о покупке ID = % дата = %', id, current_date;

	SELECT * INTO id FROM public."fGetItemID"(id_product, id_vendor);
	
	IF id IS NOT NULL
	THEN 
		SELECT * INTO total_amount
		FROM public."fGetItemAmount"(id_product, id_vendor, amount);
	
		UPDATE public."Items"
		SET "Amount" = total_amount
		WHERE "ID_Product" = id_product AND "ID_Vendor" = id_vendor;
		RAISE NOTICE 'Изменена строка о товаре ID = %', id;
	ELSE

		SELECT * INTO id FROM public."fGetNextItemID"();

		INSERT INTO "Items"("ID", "ID_Product", "ID_Vendor", "Amount")
		VALUES (id, id_product, id_vendor, amount);
		RAISE NOTICE 'Вставлена строка о товаре ID = %', id;
	END IF;	
END;
$$
