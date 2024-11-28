--DROP FUNCTION public."fGetNextPurchasesID"
CREATE OR REPLACE FUNCTION public."fGetNextPurchasesID"()
RETURNS INTEGER
AS
$$
	SELECT COALESCE(MAX(p."ID") + 1, 1)
	FROM public."Purchases" p;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetNextPurchasesID"();