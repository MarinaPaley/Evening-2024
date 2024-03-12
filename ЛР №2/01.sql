--MIN, MAX, AVG, SUM, COUNT
--Найти среднюю цену товара (ListPrice) из таблицы Production.Product. 
--Не учитывать нулевые значения цены.
SELECT AVG(p."ListPrice") AS "AverageListPrice"
FROM "Production"."Product" p 
WHERE p."ListPrice" > 0;
