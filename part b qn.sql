-- Create a function to count the number of each grade, grouped by module 
CREATE OR REPLACE FUNCTION get_modules_performance() 
RETURNS TABLE ( 
mod_registered VARCHAR(10), 
grade CHAR(2), 
grade_count BIGINT 
) AS 
$$ 
BEGIN -- Use RETURN QUERY to define the query to be executed 
RETURN QUERY -- TODO: Write the query to count the number of each grade, grouped by module 
select s.mod_registered, s.grade, count(s.grade) from stud_mod_performance s
group by s.mod_registered, s.grade
order by s.mod_registered asc;
END; 
$$ 
LANGUAGE plpgsql; 