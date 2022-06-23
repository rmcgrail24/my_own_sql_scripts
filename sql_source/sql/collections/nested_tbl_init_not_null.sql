-- Unless you impose the NOT NULL constraint in the type declaration, you can pass null elements to a constructor.
DECLARE
   TYPE dnames_tab IS TABLE OF VARCHAR2(30);
   dept_names dnames_tab;
   TYPE dnamesNoNulls_type IS TABLE OF VARCHAR2(30) NOT NULL;
BEGIN
   dept_names := dnames_tab('Shipping', NULL,'Finance', NULL);
-- If dept_names were of type dnamesNoNulls_type,
--  you could not include null values in the constructor
END;
/
