DECLARE
-- In the varray, put an upper limit on the number of elements
   TYPE dnames_var IS VARRAY(20) OF VARCHAR2(30);
   dept_names dnames_var;
BEGIN
-- Because dnames is declared as VARRAY(20),
-- you can put up to 10 elements in the constructor
   dept_names := dnames_var('Shipping','Sales','Finance','Payroll');
END;
/
