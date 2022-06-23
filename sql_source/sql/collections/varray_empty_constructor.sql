DECLARE
   TYPE dnames_var IS VARRAY(20) OF VARCHAR2(30);
   dept_names dnames_var;
BEGIN
   IF dept_names IS NULL THEN
      DBMS_OUTPUT.PUT_LINE
        ('Before initialization, the varray is null.');
-- While the varray is null, you cannot check its COUNT attribute.
--   DBMS_OUTPUT.PUT_LINE
--     ('It has ' || dept_names.COUNT || ' elements.');
   ELSE
      DBMS_OUTPUT.PUT_LINE
        ('Before initialization, the varray is not null.');
   END IF;
   dept_names := dnames_var(); -- initialize empty varray
   IF dept_names IS NULL THEN
      DBMS_OUTPUT.PUT_LINE
        ('After initialization, the varray is null.');
   ELSE
      DBMS_OUTPUT.PUT_LINE
        ('After initialization, the varray is not null.');
      DBMS_OUTPUT.PUT_LINE
        ('It has ' || dept_names.COUNT || ' elements.');
   END IF;
END;
/
