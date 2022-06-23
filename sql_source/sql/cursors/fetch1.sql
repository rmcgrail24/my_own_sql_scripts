/*
Unless you use the BULK COLLECT clause, the FETCH statement retrieves the rows in the result set one at a time.
Each fetch retrieves the current row and advances the cursor to the next row in the result set.
You can store each column in a separate variable, or store the entire row in a record that has the appropriate fields, usually declared using %ROWTYPE.

For each column value returned by the query associated with the cursor, there must be a corresponding, type-compatible variable in the INTO list.
Typically, you use the FETCH statement with a LOOP and EXIT WHEN NOTFOUND statements.
Note the use of built-in regular expression functions in the queries.
*/
DECLARE
  v_jobid     employees.job_id%TYPE;     -- variable for job_id
  v_lastname  employees.last_name%TYPE;  -- variable for last_name
  CURSOR c1 IS SELECT last_name, job_id FROM employees
                 WHERE REGEXP_LIKE (job_id, 'S[HT]_CLERK');
  v_employees employees%ROWTYPE;         -- record variable for row
  CURSOR c2 is SELECT * FROM employees
                 WHERE REGEXP_LIKE (job_id, '[ACADFIMKSA]_M[ANGR]');
BEGIN
  OPEN c1; -- open the cursor before fetching
  LOOP
    -- Fetches 2 columns into variables
    FETCH c1 INTO v_lastname, v_jobid;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( RPAD(v_lastname, 25, ' ') || v_jobid );
  END LOOP;
  CLOSE c1;
  DBMS_OUTPUT.PUT_LINE( '-------------------------------------' );
  OPEN c2;
  LOOP
    -- Fetches entire row into the v_employees record
    FETCH c2 INTO v_employees;
    EXIT WHEN c2%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( RPAD(v_employees.last_name, 25, ' ') ||
                               v_employees.job_id );
  END LOOP;
  CLOSE c2;
END;
/

