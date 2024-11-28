CREATE OR REPLACE FUNCTION fn_ddl_trigger()
RETURNS event_trigger
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE EXCEPTION 'Запрещено удалять таблицу : % ', tg_tag;
END;
$$;


DROP TABLE "Items"  