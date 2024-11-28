CREATE OR REPLACE FUNCTION public."fUpdateVendoreFullName"()
RETURNS TRIGGER AS
$$
BEGIN
	NEW."FullName" = CONCAT(NEW."Name", ' ', NEW."FirstName");
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;