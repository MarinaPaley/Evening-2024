--Вывести BusinessEntityID, LastReceiptDate и минимальное по StandardPrice для BusinessEntityID 
--с разными LastReceiptDate, предусмотреть вывод минимального StandardPrice у различных
-- BusinessEntityID из таблицы Purchasing.ProductVendor. (Использовать ROOLUP).
SELECT pv."BusinessEntityID" 
     , pv."LastReceiptDate" 
     , MIN(pv."StandardPrice")
FROM "Purchasing"."ProductVendor" pv 
GROUP BY ROLLUP (pv."BusinessEntityID", pv."LastReceiptDate" );



SELECT MAX(p."ListPrice")
	 , p."Color" 
	 , p."Size" 
FROM  "Production"."Product" p 
GROUP BY p."Color", p."Size"
ORDER BY p."Color";

SELECT MAX(p."ListPrice")
	 , p."Color" 
	 , p."Size" 
	 , GROUPING (p."Color" ) AS color
	 , GROUPING (p."Size") AS size
FROM  "Production"."Product" p 
GROUP BY ROLLUP (p."Color", p."Size");

SELECT MAX(p."ListPrice")
	 , p."Color" 
	 , p."Size" 
	 , GROUPING (p."Color" ) AS color
	 , GROUPING (p."Size") AS size
FROM  "Production"."Product" p 
GROUP BY CUBE (p."Color", p."Size");

SELECT MAX(p."ListPrice")
	 , p."Color" 
	 , p."Size" 
	 , GROUPING (p."Color" ) AS color
	 , GROUPING (p."Size") AS size
FROM  "Production"."Product" p 
GROUP BY GROUPING SETS ((p."Color"), (p."Size"), ());


ORDER BY p."Color";