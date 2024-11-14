--DROP FUNCTION public."fGetNextStoreID"
CREATE OR REPLACE FUNCTION public."fGetNextStoreID"()
RETURNS INTEGER
AS
$$
	SELECT COALESCE(MAX(s."ID") + 1, 1)
	FROM public."Stores" s;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetNextStoreID"();