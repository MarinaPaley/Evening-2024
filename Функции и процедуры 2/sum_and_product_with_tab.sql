--DROP TABLE tab;
CREATE TABLE tab(y int);
INSERT INTO tab
VALUES (5);

--DROP FUNCTION sum_and_product_with_tab(x int);
CREATE OR REPLACE FUNCTION sum_and_product_with_tab (x int)
RETURNS TABLE
(sum int, product int)
AS $$
    SELECT x + tab.y
         , x * tab.y
    FROM tab;
$$ LANGUAGE SQL;

SELECT sum_and_product_with_tab(3);

DELETE FROM tab;