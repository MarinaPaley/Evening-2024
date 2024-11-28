CREATE TRIGGER "tMakePurchases"
	BEFORE INSERT ON public."Purchases"
	FOR EACH ROW 
	EXECUTE PROCEDURE public."fUpdateItemsAfterPurchases"();