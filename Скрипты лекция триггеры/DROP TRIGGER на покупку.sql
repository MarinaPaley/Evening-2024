DROP TRIGGER IF EXISTS
"tUpdateItems" ON public."Purchases";
DROP FUNCTION IF EXISTS
public."fUpdateItems"() CASCADE;