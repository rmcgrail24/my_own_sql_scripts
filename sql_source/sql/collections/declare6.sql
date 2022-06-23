DECLARE TYPE EmpList
  IS TABLE OF employees.employee_id%TYPE NOT NULL;
  v_employees EmpList := EmpList(100, 150, 160, 200);
BEGIN
   v_employees(3) := NULL; -- assigning NULL raises an exception
END;
/
