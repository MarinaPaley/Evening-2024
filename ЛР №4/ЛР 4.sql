--1	Получите список всех PurchaseOrderDetailID, у которых UnitPrice выше средней UnitPrice всех PurchaseOrderDetail.
SELECT DISTINCT pod."PurchaseOrderID"
FROM "Purchasing"."PurchaseOrderDetail" pod
WHERE pod."UnitPrice" >
	(
		SELECT AVG(pod."UnitPrice")
		FROM "Purchasing"."PurchaseOrderDetail" pod
	)
ORDER BY pod."PurchaseOrderID";

--2	Ранжирование работников по ставке: от большей к меньшей. ("HumanResources"."EmployeePayHistory").
--Примечание к ранжированию – ранг может начинаться с произвольного числа (например, 2 или 5), 
--главное – ранг не должен уменьшаться.
SELECT eph."BusinessEntityID"
     , eph."Rate"
     , (
     	SELECT COUNT(*)
     	FROM "HumanResources"."EmployeePayHistory" eph2 
     	WHERE eph2."Rate" <= eph."Rate" 
       ) AS "Range"
FROM "HumanResources"."EmployeePayHistory" eph
ORDER BY "Range";

--3	Для каждого BusinessEntityID покажите максимальную MaxOrderQty. Таблица ProductVendor.
SELECT MAX(pv."MaxOrderQty") AS "Max"
	 , pv."BusinessEntityID" 
FROM "Purchasing"."ProductVendor" pv
GROUP BY pv."BusinessEntityID"
ORDER BY "Max";

SELECT DISTINCT pv."MaxOrderQty" AS "Max"
     , pv."BusinessEntityID" 
FROM "Purchasing"."ProductVendor" pv
WHERE pv."MaxOrderQty" IN 
	(
	SELECT MAX(pv2."MaxOrderQty")
	FROM "Purchasing"."ProductVendor" pv2
	WHERE pv."BusinessEntityID" = pv2."BusinessEntityID"
	)
ORDER BY "Max";

--4	Для каждого документа вывести его заголовок (Title), а также заголовок документа, 
--следующего за ним по алфавиту. (Production.Document).
SELECT d."Title"
     , (
     	SELECT d2."Title"
     	FROM "Production"."Document" d2
     	WHERE d."Title" < d2."Title"
     	ORDER BY d2."Title"
     	LIMIT 1
       )
FROM "Production"."Document" d
ORDER BY d."Title";

--5	Показать товары, для которых существует больше 50 стилей в одном цвете (стиль и цвет определен) 
--(Таблица Production.Product). Показать поля Name, Style и Color.
SELECT p."Name", p."Color" , p."Style" 
FROM "Production"."Product" p
WHERE p."Style" IS NOT NULL AND p."Color" IS NOT NULL
AND EXISTS (
	SELECT COUNT(p2."Style")
	FROM "Production"."Product" p2
	WHERE p2."Color" = p."Color"
	HAVING COUNT(p2."Style") > 50);

--Показать нарастающую сумму по каждому году из таблицы "Sales"."SalesOrderHeader".
WITH "SalesByYear"("Sum", "Year") AS (
	SELECT SUM(soh."SubTotal")
	     , date_part('year', soh."OrderDate") 
	FROM "Sales"."SalesOrderHeader" soh
	GROUP BY date_part('year', soh."OrderDate")
	ORDER BY date_part('year', soh."OrderDate")
)
SELECT s.*
      , (SELECT SUM(s2."Sum") AS "Accumulate"
         FROM "SalesByYear" s2 
         WHERE s2."Year" <= s."Year")
FROM "SalesByYear" s
;


