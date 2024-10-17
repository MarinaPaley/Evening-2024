--DROP TABLE tab;
CREATE TABLE tab(y int);
INSERT INTO tab
VALUES (5);

--DROP FUNCTION sum_and_product_with_tab(x int);
CREATE FUNCTION sum_and_product_with_tab (x int)
RETURNS TABLE
(sum int, product int)
AS $$
    SELECT $1 + tab.y
         , $1 * tab.y
    FROM tab;
$$ LANGUAGE SQL;

SELECT sum_and_product_with_tab(3);
