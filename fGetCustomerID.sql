CREATE FUNCTION public."fGetCustomerID"("LastName" TEXT)
RETURNS INT AS
$$
	SELECT vsp."BusinessEntityID" 
	FROM "Sales"."vSalesPerson" vsp 
	WHERE vsp."LastName" = "LastName"
$$ LANGUAGE SQL;