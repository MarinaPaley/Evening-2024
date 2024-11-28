--DROP FUNCTION public."fGetNextItemID"
CREATE OR REPLACE FUNCTION public."fGetNextItemID"()
RETURNS INTEGER
AS
$$
	SELECT COALESCE(MAX(i."ID") + 1, 1)
	FROM public."Items" i;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetNextItemID"();