SELECT "Date"
FROM "Stores" s 
EXCEPT 
SELECT "Date"
FROM "Purchases" p;

SELECT "Date" 
FROM "Purchases" p 
EXCEPT 
SELECT "Date"
FROM "Stores" s ;