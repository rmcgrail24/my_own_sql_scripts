CREATE OR REPLACE PROCEDURE proc1 IS
BEGIN
   DBMS_OUTPUT.put_line('running proc1');
   RAISE NO_DATA_FOUND;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.put_line('Error stack in block where raised:');
      my_putline(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      RAISE;
END;
/
CREATE OR REPLACE PROCEDURE proc2 IS
   l_str VARCHAR2(30) := 'calling proc1';
BEGIN
   DBMS_OUTPUT.put_line(l_str);
   proc1;
END;
/
CREATE OR REPLACE PROCEDURE proc3 IS
BEGIN
   DBMS_OUTPUT.put_line('calling proc2');
   proc2;
EXCEPTION
   WHEN OTHERS THEN
      DECLARE
         l_trace bt.error_rt;
      BEGIN
         l_trace := bt.info (DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
         raise_application_error (-20000,
                                    'Error'
                                 || ' encountered on line '
                                 || l_trace.line_number
                                 || ' in program '
                                 || l_trace.program_owner
                                 || '.'
                                 || l_trace.program_name
                              );
      END;
END proc3;
/
