--Для каждой профессии (JobTitle) найти количество женщин, которые были приняты позже 2008 года, 
--из таблицы HumanResources.Employee, 
--не учитывать пустые значения.
SELECT COUNT(*), e."JobTitle" 
FROM "HumanResources"."Employee" e 
WHERE e."JobTitle" IS NOT NULL AND "Gender" = 'F' 
	  AND e."HireDate" > '2008.01.01'
GROUP BY e."JobTitle";