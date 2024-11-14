ALTER TABLE public."Vendors" 
ADD COLUMN "FirstName" VARCHAR(25);

ALTER TABLE public."Vendors" 
ADD COLUMN "FullName" VARCHAR(25);

UPDATE public."Vendors" 
SET "FirstName" = 'Иван'
WHERE "ID" = 1;

UPDATE public."Vendors" 
SET "FirstName" = 'Петр'
WHERE "ID" = 2;

UPDATE public."Vendors" 
SET "FullName" = CONCAT("Name", ' ', "FirstName");