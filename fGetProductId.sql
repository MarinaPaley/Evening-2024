CREATE FUNCTION public."fGetProductId"(name varchar(25))
RETURNS INT AS 
$$
	SELECT p."ID" 
    FROM "Products" p
    WHERE p."Name" = name
$$ LANGUAGE SQL

