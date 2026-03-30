CREATE PROCEDURE public."pMakePurshases"(
	  IN productname varchar(25)
	, IN vendorname varchar(25)
	, IN amount INT
	, IN price NUMERIC(8, 4))
LANGUAGE plpgsql
AS
$$
DECLARE
	  idproduct INT;
	  idvendor INT;
	  id INT;
BEGIN
	SELECT * INTO idproduct FROM public."fGetProductId"(productname);
    SELECT * INTO idvendor FROM public."fGetVendorId"(vendorname);
    SELECT * INTO id FROM publc."fGetNextIdPurchases"();
   
    INSERT INTO "Purchases"("ID", "ID_Vendors", "ID_Products", "Price", "Amount", "Date")
    VALUES (id, idvendor, idproduct, price, amount, now());
END;
$$
