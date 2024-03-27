ALTER TABLE "Stores"
ADD COLUMN "Amount" INT;

ALTER TABLE "Stores"
ALTER COLUMN "ID"
SET NOT NULL;

ALTER TABLE "Stores"
ADD CONSTRAINT "PK_Stores"
PRIMARY KEY ("ID");

ALTER TABLE "Stores"
ADD CONSTRAINT "FK_Stores_Products"
FOREIGN KEY ("ID_Product")
REFERENCES "Products";

ALTER TABLE "Stores"
ADD CONSTRAINT "FK_Stores_Vendors"
FOREIGN KEY ("ID_Vendor")
REFERENCES "Vendors";

ALTER TABLE "Stores"
ADD CONSTRAINT "CH_Stores_Date"
CHECK ("Date" >= '2000-01-01' AND "Date" <= current_date);

ALTER TABLE "Stores"
ADD CONSTRAINT "CH_Stores_Price"
CHECK ("Price" > 0);

ALTER TABLE "Stores"
ADD CONSTRAINT "CH_Stores_Amount"
CHECK ("Amount" > 0);

ALTER TABLE "Stores"
ALTER COLUMN "Date"
SET DEFAULT current_date;
