CREATE OR REPLACE FUNCTION public."fStoreForProduct"(product TEXT)
RETURNS TABLE(
	  "Vendor" TEXT
	, "Amount" INT
	, "Price" NUMERIC(8, 4)
	, "Date" DATE)
LANGUAGE plpgsql
AS
$function$
BEGIN
	RETURN QUERY
	SELECT
	  v."Name"::TEXT AS "VendorName"
	, s."Amount"::INT
	, s."Price"::NUMERIC(8, 4)
	, s."Date"::Date
FROM "Products" p 
	INNER JOIN "Stores" s 
	ON s."ID_Products" = p."ID" 
		INNER JOIN "Vendors" v 
		ON v."ID"  = s."ID_Vendors"
	WHERE p."Name" = product;
END;
$function$

--DROP FUNCTION public."fStoreForProduct"(product TEXT)

SELECT * FROM public."fStoreForProduct"('Томаты');