--Найти средний вес (Weight) товара желтого (Yellow) цвета (Color) из таблицы Production.Product,
-- не учитывать пустые значения.
SELECT AVG("Weight")
FROM "Production"."Product" p 
WHERE "Color" = 'Yellow' AND "Weight" IS NOT NULL;