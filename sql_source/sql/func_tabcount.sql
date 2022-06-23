/* Formatted on 05/05/2011 15:09 (Formatter Plus v4.8.8) */
CREATE OR REPLACE FUNCTION tabcount (tab IN VARCHAR2, whr IN VARCHAR2 := NULL)
   RETURN PLS_INTEGER
IS
   e_no_such_table   EXCEPTION;
   PRAGMA EXCEPTION_INIT (e_no_such_table, -942);
   str               VARCHAR2 (32767);
   retval            PLS_INTEGER;

   PROCEDURE pl (str IN VARCHAR2, len IN INTEGER := 80)
   IS
      v_len      PLS_INTEGER     := LEAST (len, 255);
      v_len2     PLS_INTEGER;
      v_chr10   PLS_INTEGER;
      v_str      VARCHAR2 (2000);
   BEGIN
      IF LENGTH (str) > v_len
      THEN
         v_chr10 := INSTR (str, CHR (10));

         IF     v_chr10 > 0
            AND v_len >= v_chr10
         THEN
            v_len := v_chr10 - 1;
            v_len2 := v_chr10 + 1;
         ELSE
            v_len := v_len - 1;
            v_len2 := v_len;
         END IF;

         v_str := SUBSTR (str, 1, v_len);
         DBMS_OUTPUT.put_line (v_str);
         pl (SUBSTR (str, v_len2), len);
      ELSE
         DBMS_OUTPUT.put_line (str);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.ENABLE (1000000);
         DBMS_OUTPUT.put_line (v_str);
   END pl;

   PROCEDURE report_error (errmsg_in IN VARCHAR2)
   IS
   BEGIN
      pl ('tabCount ERROR:');
      pl (errmsg_in);
      pl ('tabCount Backtrace:');
      pl (DBMS_UTILITY.format_error_backtrace);
      pl ('Dynamic query:');
      pl (str);
   END report_error;
BEGIN
   str := 'SELECT COUNT(*) FROM ' || tab || ' WHERE ' || NVL(whr, '1=1');

   EXECUTE IMMEDIATE str
                INTO retval;
   RETURN retval;
EXCEPTION
   WHEN e_no_such_table
   THEN
      report_error ('Unable to find a table or view named "' || tab || '"');
      RETURN NULL;
   WHEN OTHERS
   THEN
      report_error (DBMS_UTILITY.format_error_stack);
      RETURN NULL;
END tabcount;
