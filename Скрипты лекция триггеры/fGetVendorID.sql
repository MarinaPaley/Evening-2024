--DROP FUNCTION "fGetVendorID"
CREATE OR REPLACE FUNCTION public."fGetVendorID"(vendor VARCHAR(25))
RETURNS INTEGER
AS
$$
	SELECT v."ID"
	FROM public."Vendors" v
	WHERE v."Name" = vendor;
$$ LANGUAGE SQL;

--SELECT * FROM public."fGetVendorID"('NULL');