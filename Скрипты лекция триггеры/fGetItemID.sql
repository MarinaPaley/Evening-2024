--DROP FUNCTION public."fGetItemID"
CREATE OR REPLACE FUNCTION public."fGetItemID"(id_product INTEGER, id_vendor INTEGER)
RETURNS INTEGER
AS
$$
	SELECT i."ID"
	FROM public."Items" i
	WHERE i."ID_Product" = id_product AND i."ID_Vendor" = id_vendor;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetItemID"(3, 3);