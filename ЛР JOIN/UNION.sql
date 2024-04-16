--UNION
SELECT "ID","Date"
FROM "Stores" s 
UNION 
SELECT "ID","Date"
FROM "Purchases" p;

SELECT "ID","Date"  
FROM "Stores" s 
UNION ALL
SELECT "ID","Date"  
FROM "Purchases" p;