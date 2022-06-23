DECLARE
  TYPE few_depts  IS VARRAY(10)  OF VARCHAR2(30);
  TYPE many_depts IS VARRAY(100) OF VARCHAR2(64);
  some_depts few_depts;

  /* If the type of some_depts changes from few_depts to many_depts,
     local_depts and global_depts will use the same type
     when this block is recompiled */

  local_depts  some_depts%TYPE;
  global_depts some_depts%TYPE;
BEGIN
  NULL;
END;
/
