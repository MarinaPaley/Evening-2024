--Вывести типы (PhoneNumberTypeID) из таблицы Person.PersonPhone,
-- где в номере телефона данного типа первые две цифры совпадают 
--с последними двумя и количество таких номеров телефонов больше 7.
SELECT pp."PhoneNumberTypeID"
FROM "Person"."PersonPhone" pp 
WHERE LEFT(pp."PhoneNumber", 2) = RIGHT(pp."PhoneNumber", 2)
GROUP BY pp."PhoneNumberTypeID" 
HAVING COUNT (pp."PhoneNumberTypeID") > 7;