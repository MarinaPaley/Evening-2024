INSERT INTO public."Vendors" ("ID", "Name", "FirstName")
VALUES (3, 'Васильев', 'Василий');

INSERT INTO public."Vendors" ("ID", "Name", "FirstName")
VALUES (4, 'Яшин', 'Яков');

UPDATE public."Vendors"
SET "Name" = 'Яков'
WHERE "ID" = 4;