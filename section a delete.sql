CREATE OR REPLACE PROCEDURE delete_module(IN p_code VARCHAR(10))
AS $$
BEGIN
-- Check if the module already exists
IF NOT EXISTS (SELECT * FROM module WHERE mod_code = p_code) THEN
RAISE EXCEPTION 'Module % doesnt exists', p_code;
END IF;
-- delete module
delete from module where mod_code=p_code;
END;
$$ LANGUAGE plpgsql;
