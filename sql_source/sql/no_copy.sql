DECLARE
  TYPE EmpTabTyp IS TABLE OF employees%ROWTYPE;
  emp_tab EmpTabTyp := EmpTabTyp(NULL);  -- initialize
  t1 NUMBER;
  t2 NUMBER;
  t3 NUMBER;
  PROCEDURE get_time (t OUT NUMBER) IS
    BEGIN t := DBMS_UTILITY.get_time; END;
  PROCEDURE do_nothing1 (tab IN OUT EmpTabTyp) IS
    BEGIN
      NULL;
    END;
  PROCEDURE do_nothing2 (tab IN OUT NOCOPY EmpTabTyp) IS
    BEGIN
      NULL;
    END;
BEGIN
  SELECT * INTO emp_tab(1)
    FROM employees
    WHERE employee_id = 100;
  -- Copy element 1 into 2..50000
  emp_tab.EXTEND(49999, 1);
  get_time(t1);
  -- Pass IN OUT parameter
  do_nothing1(emp_tab);
  get_time(t2);
  -- Pass IN OUT NOCOPY parameter
  do_nothing2(emp_tab);
  get_time(t3);
  DBMS_OUTPUT.PUT_LINE('Call Duration (secs)');
  DBMS_OUTPUT.PUT_LINE('--------------------');
  DBMS_OUTPUT.PUT_LINE
    ('Just IN OUT: ' || TO_CHAR((t2 - t1)/100.0));
  DBMS_OUTPUT.PUT_LINE
    ('With NOCOPY: ' || TO_CHAR((t3 - t2))/100.0);
END;
.
/

