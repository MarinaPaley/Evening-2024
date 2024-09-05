SELECT "Date"
FROM "Stores" s 
INTERSECT 
SELECT "Date"
FROM "Purchases" p;