/* The query can reference PL/SQL variables within its scope. Any variables in the query are evaluated only when the cursor is opened.
   In this example, each retrieved salary is multiplied by 2, even though factor is incremented after every fetch. */

DECLARE
  my_sal employees.salary%TYPE;
  my_job employees.job_id%TYPE := 'SA_REP';
  factor INTEGER := 2;
  CURSOR c1 IS
    SELECT factor*salary FROM employees WHERE job_id = my_job;
BEGIN
   OPEN c1;  -- factor initially equals 2
   LOOP
      FETCH c1 INTO my_sal;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Variable my_sal = ' || my_sal || ', factor = ' || factor);
      factor := factor + 1;  -- does not affect FETCH
   END LOOP;
   CLOSE c1;
END;
/

