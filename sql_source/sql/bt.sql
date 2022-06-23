CREATE PACKAGE bt
IS
   TYPE error_rt IS RECORD(
      program_owner all_objects.owner%TYPE,
      program_name  all_objects.object_name%TYPE,
      line_number PLS_INTEGER
   );

   FUNCTION info (backtrace_in IN VARCHAR2)
      RETRUN error_bt;

   PROCEDURE show_info (backtrace_in IN VARCHAR2);
END bt;
/

