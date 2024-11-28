CREATE OR REPLACE FUNCTION public."fStoreForVendor"(vendor TEXT)
RETURNS TABLE(
	  "Product" TEXT
	, "Amount" INT
	, "Price" NUMERIC(8, 4)
	, "Date" DATE)
LANGUAGE plpgsql
AS
$function$
BEGIN
	RETURN QUERY
	SELECT
	  p."Name"::TEXT AS "ProductName"
	, s."Amount"::INT
	, s."Price"::NUMERIC(8, 4)
	, s."Date"::Date
FROM "Products" p 
	INNER JOIN "Stores" s 
	ON s."ID_Products" = p."ID" 
		INNER JOIN "Vendors" v 
		ON v."ID"  = s."ID_Vendors"
	WHERE v."Name" = vendor;
END;
$function$

--DROP FUNCTION public."fStoreForProduct"(product TEXT)

SELECT * FROM public."fStoreForVendor"('Иванов');
SELECT * FROM public."vStores"