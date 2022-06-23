DECLARE
-- Nested table type that can hold an arbitrary number
--   of employee IDs.
-- The element type is based on a column from the EMPLOYEES table.
-- You need not know whether the ID is a number or a string.
   TYPE EmpList IS TABLE OF employees.employee_id%TYPE;
-- Declare a cursor to select a subset of columns.
   CURSOR c1 IS SELECT employee_id FROM employees;
-- Declare an Array type that can hold information
--   about 10 employees.
-- The element type is a record that contains all the same
-- fields as the EMPLOYEES table.
   TYPE Senior_Salespeople IS VARRAY(10) OF employees%ROWTYPE;
-- Declare a cursor to select a subset of columns.
   CURSOR c2 IS SELECT first_name, last_name FROM employees;
-- Array type that can hold a list of names. The element type
-- is a record that contains the same fields as the cursor
-- (that is, first_name and last_name).
   TYPE NameList IS VARRAY(20) OF c2%ROWTYPE;
BEGIN
   NULL;
END;
/
