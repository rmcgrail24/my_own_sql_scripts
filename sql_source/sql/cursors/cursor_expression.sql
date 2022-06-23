DECLARE
   TYPE emp_cur_typ IS REF CURSOR;

   emp_cur    emp_cur_typ;
   dept_name  departments.department_name%TYPE;
   emp_name   employees.last_name%TYPE;

   CURSOR c1 IS SELECT
     department_id,
     CURSOR (SELECT e.last_name
               FROM employees e
                 WHERE e.department_id = d.department_id) employees
       FROM departments d
         WHERE department_name LIKE 'A%';
BEGIN
  OPEN c1;
  LOOP -- Process each row of query's result set
    FETCH c1 INTO dept_name, emp_cur;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Department: ' || dept_name);

    LOOP -- Process each row of subquery's result set
         -- (this could be done in a procedure instead)
      FETCH emp_cur INTO emp_name;
      EXIT WHEN emp_cur%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('-- Employee: ' || emp_name);
    END LOOP;
  END LOOP;
  CLOSE c1;
END;
/
