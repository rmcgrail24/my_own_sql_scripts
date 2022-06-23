CREATE OR REPLACE PACKAGE sqlerr

-- Package of pre-defined exceptions that commonly occur when 
-- working with SQL, and especially dynamic SQL, inside PL/SQL.

IS
   no_such_table EXCEPTION;
      PRAGMA EXCEPTION_INIT (no_such_table, -942);
   invalid_table_name EXCEPTION;
      PRAGMA EXCEPTION_INIT (invalid_table_name, -903);
   invalid_column_name EXCEPTION;
      PRAGMA EXCEPTION_INIT (invalid_column_name, -904);
   missing_into EXCEPTION;
      PRAGMA EXCEPTION_INIT (missing_into, -925);
   inconsistent_datatypes EXCEPTION;
      PRAGMA EXCEPTION_INIT (inconsistent_datatypes, -932);
   duplicate_column_name EXCEPTION;
      PRAGMA EXCEPTION_INIT (duplicate_column_name, -957);
   missing_set EXCEPTION;
      PRAGMA EXCEPTION_INIT ( missing_set , -971);
   max_cursors_exceeded EXCEPTION;
      PRAGMA EXCEPTION_INIT ( max_cursors_exceeded , -1000);
   fetch_out_of_seq EXCEPTION;
      PRAGMA EXCEPTION_INIT ( fetch_out_of_seq , -1003);
   no_such_bind_variable EXCEPTION;
      PRAGMA EXCEPTION_INIT ( no_such_bind_variable , -1006);
   not_all_variables_bound EXCEPTION;
      PRAGMA EXCEPTION_INIT ( not_all_variables_bound , -1008);
   invalid_username_pwd EXCEPTION;
      PRAGMA EXCEPTION_INIT ( invalid_username_pwd , -1017);
   insufficient_privileges EXCEPTION;
      PRAGMA EXCEPTION_INIT ( insufficient_privileges , -1031);
   notnull_column_null EXCEPTION;
      PRAGMA EXCEPTION_INIT ( notnull_column_null , -1400);
   ins_value_too_large EXCEPTION;
      PRAGMA EXCEPTION_INIT ( ins_value_too_large , -1401);
   no_such_user EXCEPTION;
      PRAGMA EXCEPTION_INIT ( no_such_user , -1435);
   plsql_compile_error EXCEPTION;
      PRAGMA EXCEPTION_INIT ( plsql_compile_error , -6550);
END sqlerr;
/
