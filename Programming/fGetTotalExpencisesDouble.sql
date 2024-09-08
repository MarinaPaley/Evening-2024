CREATE OR REPLACE FUNCTION "fGetTotalExpencisesDouble"()
RETURNS NUMERIC
AS $$
	SELECT SUM(vs."Total" )
    FROM "vStores" vs;
$$ LANGUAGE SQL;

SELECT "fGetTotalExpencisesDouble"();

CREATE FUNCTION one() 
RETURNS integer AS 
$$
    SELECT 1 
    AS result;
$$ LANGUAGE SQL;

SELECT public.one();