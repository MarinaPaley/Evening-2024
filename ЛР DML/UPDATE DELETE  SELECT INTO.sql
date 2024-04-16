DROP TABLE "Copy" 

SELECT * INTO "Copy" 
FROM "Production"."Product"; 

SELECT c."ListPrice", c."Name"
FROM public."Copy" c 
WHERE "Color" = 'Red'

UPDATE "Copy"
SET "ListPrice" = "ListPrice" * 1.1
WHERE "Color" = 'Red'

DELETE 
FROM "Copy"
WHERE "ListPrice" < 1000