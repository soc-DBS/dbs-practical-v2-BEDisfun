
-- create module stored procedure
CREATE OR REPLACE PROCEDURE create_module(IN p_code VARCHAR(10), IN p_name
VARCHAR(100), IN p_credit INT)
AS $$
BEGIN
-- Check if the module already exists
IF EXISTS (SELECT * FROM module WHERE mod_code = p_code) THEN
RAISE EXCEPTION 'Module % already exists', p_code;
END IF;
-- Insert the new module
INSERT INTO module (mod_code, mod_name, credit_unit) VALUES (p_code, p_name,
p_credit);
END;
$$ LANGUAGE plpgsql;