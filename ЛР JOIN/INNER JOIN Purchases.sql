SELECT 
	  s."ID" 
	, p."Name" AS "Product"
	, v."Name" AS "Vendor"
	, s."Price" 
	, s."Date" 
	, s."Amount" 
	, s."Price" * s."Amount"  AS "Total"
FROM "Purchases"  s 
INNER JOIN "Products" p 
ON p."ID"  = s."ID_Product" 
	INNER JOIN "Vendors" v
	ON v."ID" = s."ID_Vendor";
	
SELECT *
FROM "Stores" s , "Products" p 
--WHERE s."ID_Product"  = p."ID" 

SELECT *
FROM "Stores" s 
CROSS JOIN "Products" p ;