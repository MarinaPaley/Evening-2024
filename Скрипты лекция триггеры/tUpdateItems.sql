CREATE TRIGGER "tUpdateItems" BEFORE
INSERT
    ON
    public."Purchases" FOR EACH ROW EXECUTE FUNCTION "fUpdateItems"();