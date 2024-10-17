CREATE TABLE emp (
    name        text,
    salary      numeric,
    age         integer,
    cubicle     point
);
--DROP TABLE emp;
INSERT INTO emp VALUES ('Bill', 4200, 45, '(2,1)');
--DROP FUNCTION new_emp();
CREATE FUNCTION new_emp() 
RETURNS emp AS 
$$
    SELECT text 'None' AS name,
        1000.0 AS salary,
        25 AS age,
        point '(2,2)' AS cubicle;
$$ LANGUAGE SQL;

SELECT new_emp();

