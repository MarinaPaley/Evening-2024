--SELF JOIN
-- Какие товары производят все поставщики
SELECT DISTINCT
	s1."ID_Product"
  , s1."ID_Vendor"
FROM "Stores" s1 
INNER JOIN "Stores" s2
ON s1."ID_Product" = s2."ID_Product" 
WHERE s1."ID_Vendor" <> s2."ID_Vendor";

--Какие производители поставляют все товары
SELECT DISTINCT
	s1."ID_Product"
  , s1."ID_Vendor"
FROM "Stores" s1 
INNER JOIN "Stores" s2
ON s1."ID_Product" <> s2."ID_Product" 
WHERE s1."ID_Vendor" = s2."ID_Vendor";