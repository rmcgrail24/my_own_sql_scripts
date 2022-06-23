/* If a NULL argument is passed to a built-in function, a NULL value is returned except in the following cases.

   The function DECODE compares its first argument to one or more search expressions, which are paired with result expressions.
   Any search or result expression can be NULL. If a search is successful, the corresponding result is returned.
   In this example, if the column manager_id is NULL, DECODE returns the value 'nobody'.
*/

DECLARE
  manager  VARCHAR2(40);
  name     employees.last_name%TYPE;
BEGIN
  -- NULL is a valid argument to DECODE.
  -- In this case, manager_id is NULL
  -- and the DECODE function returns 'nobody'.

  SELECT DECODE(manager_id, NULL, 'nobody', 'somebody'), last_name
    INTO manager, name
    FROM employees
    WHERE employee_id = 100;

  DBMS_OUTPUT.PUT_LINE (name || ' is managed by ' || manager);
END;
/

