CREATE TRIGGER "tUpdateVendorFullName"
    BEFORE INSERT ON public."Vendors"
    FOR EACH ROW 
EXECUTE PROCEDURE public."fUpdateVendorFullName"();
