-- DROP FUNCTION public."fUpdateItems"();

CREATE OR REPLACE FUNCTION public."fUpdateItems"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
	UPDATE public."Items"
	SET "Amount" = "Amount" - NEW."Amount"
    WHERE "ID_Product" = NEW."ID_Products" AND "ID_Vendor" = NEW."ID_Vendors";
    RETURN NEW;
END;
$function$
;