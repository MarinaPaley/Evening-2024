CREATE FUNCTION public."fGetVendorId"(name varchar(25))
RETURNS INT AS 
$$
	SELECT p."ID" 
    FROM "Vendors" p
    WHERE p."Name" = name
$$ LANGUAGE SQL