--Изменить запрос п.5 использовать CUBE. 
--Отделить строки, созданные с помощью агрегатных функций от строк из фактической таблицы.
SELECT pv."BusinessEntityID" 
     , pv."LastReceiptDate" 
     , MIN(pv."StandardPrice")
     , GROUPING (pv."BusinessEntityID") AS "1"
     , GROUPING (pv."LastReceiptDate") AS "2"
FROM "Purchasing"."ProductVendor" pv 
GROUP BY CUBE (pv."BusinessEntityID", pv."LastReceiptDate" );