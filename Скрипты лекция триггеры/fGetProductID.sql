--DROP FUNCTION "fGetProductID"
CREATE OR REPLACE FUNCTION public."fGetProductID"(product VARCHAR(25))
RETURNS INTEGER
AS
$$
	SELECT p."ID"
	FROM public."Products" p
	WHERE p."Name" = product;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetProductID"('');