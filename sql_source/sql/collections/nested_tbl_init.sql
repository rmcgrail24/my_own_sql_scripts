/*
Until you initialize it, a nested table or varray is atomically null; the collection itself is null, not its elements.
To initialize a nested table or varray, you use a constructor, a system-defined function with the same name as the collection type.
This function constructs collections from the elements passed to it.

You must explicitly call a constructor for each varray and nested table variable.
Associative arrays, the third kind of collection, do not use constructors.
Constructor calls are allowed wherever function calls are allowed.
*/

DECLARE
   TYPE dnames_tab IS TABLE OF VARCHAR2(30);
   dept_names dnames_tab;
BEGIN
   dept_names := dnames_tab('Shipping','Sales','Finance','Payroll');
END;
/

