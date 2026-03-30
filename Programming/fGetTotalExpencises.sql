SELECT SUM(vs."Total" )
FROM "vStores" vs;

CREATE OR REPLACE FUNCTION "fGetTotalExpencises"()
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE 
	total NUMERIC;
BEGIN 
	SELECT SUM(vs."Total" )
	INTO total
    FROM "vStores" vs;
    
    RETURN total;
END;
$$

SELECT * FROM "fGetTotalExpencises"();