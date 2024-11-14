--DROP FUNCTION public."fGetItemAmount"
CREATE OR REPLACE FUNCTION public."fGetItemAmount"(
	  id_product INTEGER
	, id_vendor INTEGER
	, amount INTEGER)
RETURNS INTEGER
AS
$$
	SELECT SUM(i."Amount") + amount
	FROM public."Items" i
	WHERE i."ID_Product" = id_product AND i."ID_Vendor" = id_vendor;
$$ LANGUAGE SQL;

SELECT * FROM public."fGetItemAmount"(3, 2, 1);