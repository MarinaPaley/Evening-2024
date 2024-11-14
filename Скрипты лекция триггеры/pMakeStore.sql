--DROP PROCEDURE public."pMakeStore";
CREATE OR REPLACE PROCEDURE public."pMakeStore"(
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
	IF product IS NULL OR product = ''
	THEN
		RAISE EXCEPTION 'Неправильное имя продукта';
	END IF;
	IF vendor IS NULL OR vendor = ''
	THEN
		RAISE EXCEPTION 'Неправильное имя поставщика';
	END IF;
	IF amount <=0
	THEN
		RAISE EXCEPTION 'Неправильное количество %', amount;
	END IF;
	IF price <=0
	THEN
		RAISE EXCEPTION 'Неправильная цена %', price;
	END IF;

	SELECT p."ID"
	INTO id_product
	FROM public."Products" p
	WHERE p."Name" = product;
	
	IF id_product IS NULL
	THEN
		RAISE EXCEPTION 'Не найден продукт %', product;
	END IF;
	
	SELECT v."ID"
	INTO id_vendor
	FROM public."Vendors" v
	WHERE v."Name" = vendor;
	
	IF id_vendor IS NULL
	THEN
		RAISE EXCEPTION 'Не найден поставщик %', vendor;
	END IF;
	
	SELECT COALESCE(MAX(s."ID") + 1, 1)
	INTO id
	FROM public."Stores" s;

	INSERT INTO "Stores"("ID", "ID_Vendors", "ID_Products", "Amount", "Price", "Date")
	VALUES (id, id_vendor, id_product, amount, price, current_date);
	RAISE NOTICE 'Вставлена строка о покупке ID = % дата = %', id, current_date;

	SELECT i."ID"
	INTO id
	FROM public."Items" i
	WHERE i."ID_Product" = id_product AND i."ID_Vendor" = id_vendor;
	
	RAISE NOTICE 'ID Items = %', id;
	
	IF id IS NOT NULL
	THEN 
		SELECT SUM(i."Amount") + amount
		INTO total_amount
		FROM public."Items" i
		WHERE i."ID_Product" = id_product AND i."ID_Vendor" = id_vendor;
	
		UPDATE public."Items"
		SET "Amount" = total_amount
		WHERE "ID_Product" = id_product AND "ID_Vendor" = id_vendor;
		RAISE NOTICE 'Изменена строка о товаре ID = %', id;
	ELSE
		SELECT COALESCE(MAX(i."ID") + 1, 1)
		INTO id
		FROM public."Items" i;

		INSERT INTO "Items"("ID", "ID_Product", "ID_Vendor", "Amount")
		VALUES (id, id_product, id_vendor, amount);
		RAISE NOTICE 'Вставлена строка о товаре ID = %', id;
	END IF;	
END;
$$
