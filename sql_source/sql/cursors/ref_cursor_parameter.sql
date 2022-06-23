/* This example decalres a cursor variable as the formal parameter of a subprogram.
   First, the PL/sl block defines a REF CURSOR type, then declares a cursor
   variable fo that type as a formal parameter.
*/

DECLARE
   TYPE empcurtyp IS REF CURSOR RETURN employees%ROWTYPE;
   emp empcurtyp;
-- after result set is built,
-- process all the rows inside a single procedure
-- rather than invoking a procedure for each row
   PROCEDURE process_emp_cv (emp_cv IN empcurtyp) IS
      person employees%ROWTYPE;
   BEGIN
      DBMS_OUTPUT.PUT_LINE('-----');
      DBMS_OUTPUT.PUT_LINE
        ('Here are the names from the result set:');
      LOOP
         FETCH emp_cv INTO person;
         EXIT WHEN emp_cv%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('Name = ' || person.first_name ||
                              ' ' || person.last_name);
      END LOOP;
   END;
BEGIN
-- First find 10 arbitrary employees.
  OPEN emp FOR SELECT * FROM employees WHERE ROWNUM < 11;
  process_emp_cv(emp);
  CLOSE emp;
-- find employees matching a condition.
  OPEN emp FOR SELECT * FROM employees WHERE last_name LIKE 'R%';
  process_emp_cv(emp);
  CLOSE emp;
END;
/
