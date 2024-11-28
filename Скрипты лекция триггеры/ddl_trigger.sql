CREATE EVENT TRIGGER ddl_trigger
ON ddl_command_start WHEN tag in ('DROP TABLE')
EXECUTE PROCEDURE fn_ddl_trigger();
