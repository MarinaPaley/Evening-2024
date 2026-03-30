CREATE VIEW "vStores" AS
SELECT s."ID" 
     , p."Name" AS "ProductName" 
     , v."Name" AS "Vendor"
     , s."Date" 
     , s."Amount" 
     , s."Price"
     , s."Amount" * s."Price" AS "Total"
FROM "ShopNew".public."Stores" s 
INNER JOIN "ShopNew".public."Products" p 
	ON s."ID_Product" = p."ID" 
	INNER JOIN "ShopNew".public."Vendors" v 
	ON s."ID_Vendor" = v."ID";

SELECT * FROM "vStores";

CREATE VIEW "vStoresBaku"
AS
SELECT v."ProductName" , v."Vendor" , v."Total" 
FROM "vStores" v
WHERE v."Vendor" LIKE 'Баку';

SELECT *
FROM "vStoresBaku";

CREATE TABLE "A"
("ID" int, "Name" VARCHAR);

INSERT INTO "A" VALUES
(1, '1'), (2, '2'), (3, '3');

CREATE VIEW "vA" AS
SELECT a."ID", a."Name"
FROM "A" a
WHERE a."ID" = 3;
 
INSERT INTO "vA" VALUES (3, '4');

SELECT *
FROM "vA";

INSERT INTO "vA" VALUES (5, '4');

CREATE OR REPLACE VIEW "vA" AS 
SELECT a."ID", a."Name"
FROM "A" a
WHERE a."ID" = 3
WITH LOCAL CHECK OPTION;