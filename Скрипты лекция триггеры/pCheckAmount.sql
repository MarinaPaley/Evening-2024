CREATE OR REPLACE PROCEDURE public."pCheckAmount"(
	  IN id_product INT
	, IN id_vendor INT
	, IN amount INT)
LANGUAGE plpgsql
AS
$$
DECLARE
	total_amount INT;
BEGIN
	SELECT *
	INTO total_amount
	FROM public."fGetAmount"(id_product, id_vendor);

	IF total_amount < amount
	THEN
		RAISE EXCEPTION 'Количество товара % меньше заданного %', total_amount, amount;
	END IF;
END;
$$
