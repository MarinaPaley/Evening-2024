SELECT *
FROM "Stores" s 
LEFT OUTER JOIN "Purchases" p
ON s."Date" = p."Date";

SELECT * 
FROM "Purchases" p
LEFT OUTER JOIN "Stores" s 
ON s."Date" = p."Date";

SELECT * 
FROM  "Stores" s
FULL OUTER JOIN "Purchases" p
ON s."Date" = p."Date";