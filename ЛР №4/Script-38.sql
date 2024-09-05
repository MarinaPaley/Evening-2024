--Найти среднюю цену всех максимальных цен в каждом цвете
SELECT AVG("T"."MaxPrice")
FROM
(SELECT Max(p."ListPrice") AS "MaxPrice"
FROM "Production"."Product" p 
GROUP BY p."Color") AS "T"

--Найти максимальную (минимальную) всех любых (макc, мин, средняя) цен в каждом цвете
SELECT Max(p."ListPrice") AS "MaxPrice"
FROM "Production"."Product" p 
GROUP BY p."Color"
ORDER BY Max(p."ListPrice") DESC
LIMIT 1;

--Найти все товары, у которых цена равна максимальной для каждого цвета
SELECT p."Name" , p."ListPrice" , p."Color" 
FROM "Production"."Product" p 
WHERE p."ListPrice"  = 
(
	SELECT Max(p."ListPrice") AS "MaxPrice"
	FROM "Production"."Product" p
);

SELECT 
	  p1."Name" 
	, p1."ListPrice" 
	, p1."Color" 
	, (SELECT SUM(p1."ListPrice") 
	   FROM "Production"."Product" p1
	  )
FROM "Production"."Product" p1 

--Показать ФИО самого молодого сотрудника
SELECT p."FirstName" 
     , p."MiddleName" 
     , p."LastName" 
FROM "Person"."Person" p 
INNER JOIN "HumanResources"."Employee" e 
ON e."BusinessEntityID"  = p."BusinessEntityID" 
WHERE e."BirthDate" =
	(SELECT MAX(e."BirthDate") 
	 FROM "HumanResources"."Employee" e) 


SELECT
	 p1."ProductID"
	, p1."Quantity"
    , (SELECT SUM(p2."Quantity")
       FROM "Production"."ProductInventory" p2
       WHERE p1."ProductID" <= p2."ProductID")
FROM "Production"."ProductInventory" p1
ORDER BY "Quantity";

-- >= ANY() == >= MIN()
SELECT p."Name" , p."ListPrice" , p."Size" 
FROM "Production"."Product" p 
WHERE p."ListPrice"  >= ANY 
(
	SELECT Max(p."ListPrice") AS "MaxPrice"
	FROM "Production"."Product" p
	GROUP BY p."Size" 
)
ORDER BY p."ListPrice" ;

-- <= ANY min
SELECT p."Name" , p."ListPrice" , p."Size" 
FROM "Production"."Product" p 
WHERE p."ListPrice"  <= ANY 
(
	SELECT Max(p."ListPrice") AS "MaxPrice"
	FROM "Production"."Product" p
	GROUP BY p."Size" 
)
ORDER BY p."ListPrice" ;

-- <=ALL == <= MIN()
SELECT p."Name" , p."ListPrice" , p."Size" 
FROM "Production"."Product" p 
WHERE p."ListPrice"  <= ALL 
(
	SELECT Max(p."ListPrice") AS "MaxPrice"
	FROM "Production"."Product" p
	GROUP BY p."Size" 
)
ORDER BY p."ListPrice" ;

-- ALL == MAX()
SELECT p."Name" , p."ListPrice" , p."Size" 
FROM "Production"."Product" p 
WHERE p."ListPrice"  >= ALL 
(
	SELECT Max(p."ListPrice") AS "MaxPrice"
	FROM "Production"."Product" p
	GROUP BY p."Size" 
)
ORDER BY p."ListPrice" ;

--EXISTS (NOT)
SELECT * 
FROM "Production"."Copy" p1
WHERE EXISTS 
(
	SELECT 1
	FROM "Production"."Product" p2
	WHERE p1."Name" = p2."Name"
);

SELECT * 
FROM "Production"."Product" p1
WHERE NOT EXISTS 
(
	SELECT 1
	FROM "Production"."Copy"  p2
	WHERE p1."Name" = p2."Name"
);

--DROP TABLE "Production"."Copy";
SELECT "Name", "Color", "Size"
INTO "Production"."Copy"
FROM "Production"."Product" p
WHERE 1 = 2;



INSERT INTO "Production"."Copy"("Name", "Color", "Size")
VALUES 
	 ('HL Road Frame - Black, 58', 'Black', '58')
	,('HL Road Frame - Red, 58', 'Red', '58');

SELECT *
FROM (
SELECT * 
FROM "Production"."Product" p1
WHERE NOT EXISTS 
(
	SELECT 1
	FROM "Production"."Copy"  p2
	WHERE p1."Name" = p2."Name"
)) AS T
WHERE t."Name" LIKE '%Mountain Bike Socks, M%';

SELECT *
FROM  "Production"."Product"
WHERE "Name" LIKE '%Mountain Bike Socks, M%';

SELECT *
FROM  "Production"."Product"
WHERE "Color" IS NOT NULL AND "Size" IS NOT NULL
LIMIT 5;


