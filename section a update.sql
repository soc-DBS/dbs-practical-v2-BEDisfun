-- -- create module stored procedure
-- CREATE OR REPLACE PROCEDURE update_module(IN mod_cord VARCHAR(10), new_mod_code
-- VARCHAR(100), IN new_credit_unit INT,  out updated_mod_code VARCHAR(100), out updated_credit_unit INT)
-- AS $$
-- BEGIN
-- Update module
-- set mod_code = new_mod_code,
-- credit_unit = new_credit_unit
-- where mod_coord = mod_cord;
-- if found then
-- updated_mod_code := new_mod_code,
-- updated_credit_unit := new_credit_unit
-- raise notice 'Module code and credit unit updated successfully!'
-- else 
-- raise notice 'module not found or update unsuccessful'
-- END if;
-- end;
-- $$ LANGUAGE plpgsql;

-- create module stored procedure
CREATE OR REPLACE PROCEDURE update_module(IN p_code VARCHAR(10), IN p_credit INT)
AS $$
BEGIN
-- Check if the module already exists
IF not EXISTS (SELECT * FROM module WHERE mod_code = p_code) THEN
RAISE EXCEPTION 'Module % already exists', p_code;
END IF;
-- update module
update module set credit_unit=p_credit where mod_code=p_code;
END;
$$ LANGUAGE plpgsql
