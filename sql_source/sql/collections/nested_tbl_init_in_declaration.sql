/*
You can initialize a collection in its declaration, which is a good programming practice.
In this case, you can invoke the collection's EXTEND method to add elements later.
*/

DECLARE
   TYPE dnames_tab IS TABLE OF VARCHAR2(30);
   dept_names dnames_tab :=
     dnames_tab('Shipping','Sales','Finance','Payroll');
BEGIN
   NULL;
END;
/
