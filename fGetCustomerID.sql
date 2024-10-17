-- DROP FUNCTION public."fGetCustomerID"(text);

CREATE OR REPLACE FUNCTION public."fGetSalesPersonID"(lastname text)
RETURNS integer
LANGUAGE plpgsql
AS $function$
declare
	id int;
begin
	raise notice '"LastName" %', lastname;
	SELECT vsp."BusinessEntityID"
	INTO id
	FROM "Sales"."vSalesPerson" vsp 
	WHERE vsp."LastName" = lastname;

	RETURN id;
end;
$function$
