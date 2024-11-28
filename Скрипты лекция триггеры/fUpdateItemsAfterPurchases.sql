CREATE OR REPLACE FUNCTION public."fUpdateItemsAfterPurchases"()
RETURNS TRIGGER AS
$$
BEGIN
	UPDATE public."Items"
	SET "Amount" = "Amount" - NEW."Amount"
	WHERE "ID_Product" = NEW."ID_Products" 
		AND "ID_Vendor" = NEW."ID_Vendors";
	RAISE NOTICE 'Изменена строка о товаре ID = % количество %', NEW."ID", NEW."Amount";
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;