-- DROP PROCEDURE public."pMakePurshases"(varchar, varchar, int4, numeric);

CREATE OR REPLACE PROCEDURE public."pMakePurshases"
	( IN productname character VARYING
	, IN vendorname character VARYING
	, IN amount integer
	, IN price numeric)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
	  idproduct INT;
	  idvendor INT;
	  id INT;
BEGIN
	IF productname IS NULL
	THEN
		RAISE EXCEPTION 'Продукт не валиден (NULL)';
    END IF;

    IF vendorname IS NULL
	THEN
		RAISE EXCEPTION 'Продавец не валиден (NULL)';
    END IF;

	IF amount <= 0
	THEN
		RAISE EXCEPTION 'Количество должно быть больше 0';
    END IF;

	IF price <= 0
	THEN
		RAISE EXCEPTION 'Цена должна быть больше 0';
    END IF;

	SELECT * INTO idproduct FROM public."fGetProductId"(productname);
	IF idproduct IS NULL
	THEN
		RAISE EXCEPTION 'Товар % не найден', productname;
    END IF;

    SELECT * INTO idvendor FROM public."fGetVendorId"(vendorname);
	IF idvendor IS NULL
	THEN
		RAISE EXCEPTION 'Продавец с именем % не найден', vendorname;
    END IF;

    SELECT * INTO id FROM public."fGetNextIdPurchases"();
   
    INSERT INTO "Purchases"("ID", "ID_Vendors", "ID_Products", "Price", "Amount", "Date")
    VALUES (id, idvendor, idproduct, price, amount, now());

	RAISE NOTICE 'Вставлена запись о продаже с ID = %', id;
END;
$procedure$
;