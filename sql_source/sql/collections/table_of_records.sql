DECLARE
   TYPE EmployeeSet IS TABLE OF employees%ROWTYPE;
   underpaid EmployeeSet;
     -- Holds set of rows from EMPLOYEES table.
   CURSOR c1 IS SELECT first_name, last_name FROM employees;
   TYPE NameSet IS TABLE OF c1%ROWTYPE;
   some_names NameSet;
     -- Holds set of partial rows from EMPLOYEES table.
BEGIN
-- With one query,
-- bring all relevant data into collection of records.
   SELECT * BULK COLLECT INTO underpaid FROM employees
      WHERE salary < 5000 ORDER BY salary DESC;
-- Process data by examining collection or passing it to
-- eparate procedure, instead of writing loop to FETCH each row.
   DBMS_OUTPUT.PUT_LINE
     (underpaid.COUNT || ' people make less than 5000.');
   FOR i IN underpaid.FIRST .. underpaid.LAST
   LOOP
     DBMS_OUTPUT.PUT_LINE
       (underpaid(i).last_name || ' makes ' || underpaid(i).salary);
   END LOOP;
-- You can also bring in just some of the table columns.
-- Here you get the first and last names of 10 arbitrary employees.
   SELECT first_name, last_name
     BULK COLLECT INTO some_names
     FROM employees
     WHERE ROWNUM < 11;
   FOR i IN some_names.FIRST .. some_names.LAST
   LOOP
      DBMS_OUTPUT.PUT_LINE
        ('Employee = ' || some_names(i).first_name
         || ' ' || some_names(i).last_name);
   END LOOP;
END;
/
