ALTER TABLE "Purchases"
ADD COLUMN "Amount" INT;

ALTER TABLE "Purchases" 
ALTER COLUMN "ID"
SET NOT NULL;

ALTER TABLE "Purchases"
ADD CONSTRAINT "PK_Purchases"
PRIMARY KEY ("ID");

ALTER TABLE "Purchases"
ADD CONSTRAINT "FK_Purchases_Products"
FOREIGN KEY ("ID_Product")
REFERENCES "Products";

ALTER TABLE "Purchases"
ADD CONSTRAINT "FK_Purchases_Vendors"
FOREIGN KEY ("ID_Vendor")
REFERENCES "Vendors";

ALTER TABLE "Purchases"
ADD CONSTRAINT "CH_Purchases_Date"
CHECK ("Date" >= '2000-01-01' AND "Date" <= current_date);

ALTER TABLE "Purchases"
ADD CONSTRAINT "CH_Purchases_Price"
CHECK ("Price" > 0);

ALTER TABLE "Purchases"
ADD CONSTRAINT "CH_Purchases_Amount"
CHECK ("Amount" > 0);

ALTER TABLE "Purchases"
ALTER COLUMN "Date"
SET DEFAULT current_date;