SELECT *
FROM "Stores" s;

SELECT 
	  s."ID" 
	, p."Name" AS "Product"
	, v."Name" AS "Vendor"
	, s."Price" 
	, s."Date" 
	, s."Amount" 
	, s."Price" * s."Amount"  AS "Total"
FROM "Stores" s 
INNER JOIN "Products" p 
ON p."ID"  = s."ID_Product" 
	INNER JOIN "Vendors" v
	ON v."ID" = s."ID_Vendor";