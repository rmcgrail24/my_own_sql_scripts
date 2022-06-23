/* The function NVL returns the value of its second argument if its first argument is NULL.
   In this example, if the column specified in the query is NULL, the function returns the value -1 to signify a nonexistent employee in the output. */

DECLARE
  manager employees.manager_id%TYPE;
  name    employees.last_name%TYPE;
BEGIN
  -- NULL is a valid argument to NVL.
  -- In this case, manager_id is null
  -- and the NVL function returns -1.

  SELECT NVL(manager_id, -1), last_name
    INTO manager, name
    FROM employees
    WHERE employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE (name || ' is managed by employee Id: ' || manager);
END;
/

