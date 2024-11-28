CREATE OR REPLACE FUNCTION public."fGetAmount"(id_product INT, id_vendor INT)
RETURNS INTEGER
AS
$$
	SELECT i."Amount" 
	FROM public."Items" i
	WHERE i."ID_Product" = id_product AND i."ID_Vendor" = id_vendor;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetAmount"(1, 2);