--DROP FUNCTION public."fGetSalesOrderHeaderToSalerWithRaise"(text);

CREATE OR REPLACE FUNCTION public."fGetSalesOrderHeaderToSalerWithRaise"(lastname text)
 RETURNS TABLE(
   "SalesOrderID" integer
 , "OrderDate" date
 , "SubTotal" NUMERIC
 , "TerritoryName" text)
 LANGUAGE plpgsql
AS $function$
DECLARE
	id int;
BEGIN
	SELECT * INTO id FROM "fGetSalesPersonID"(lastname);
	IF id IS NULL
	THEN
		RAISE NOTICE 'Не найден продавец %', lastname;
	END IF;

	RETURN query
	SELECT 
		  soh."SalesOrderID" 
		, soh."OrderDate"::Date 
		, soh."SubTotal"
		, st."Name"
	FROM "Sales"."SalesOrderHeader" soh
		INNER JOIN "Sales"."SalesTerritory" st 
		ON st."TerritoryID" = soh."TerritoryID"
	WHERE soh."SalesPersonID" = id;
END;
$function$