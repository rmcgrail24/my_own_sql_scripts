-- First create a compute intensive procedure using PLS_INTEGER.

CREATE OR REPLACE PROCEDURE pls_test (iterations IN PLS_INTEGER)
AS
   int1      PLS_INTEGER := 1;
   int2      PLS_INTEGER := 2;
   begints   timestamp;
   endts     timestamp;
BEGIN
   begints := SYSTIMESTAMP;

   FOR cnt IN 1 .. iterations
   LOOP
      EXIT WHEN int1 = 2147483647;
--      int1 := int1 + int2 * cnt;
      int1 := int1 + 1;
/*
      IF int1 > 2140000000
      THEN
         DBMS_OUTPUT.PUT_LINE('int1 = ' || int1);
      END IF;
*/
   END LOOP;

   endts := SYSTIMESTAMP;
   DBMS_OUTPUT.put_line(   iterations
                        || ' iterations had run time of:'
                        || TO_CHAR (endts - begints));
END;
/

-- Next create the same procedure using SIMPLE_INTEGER

CREATE OR REPLACE PROCEDURE simple_test (iterations IN SIMPLE_INTEGER)
AS
   int1      SIMPLE_INTEGER := 1;
   int2      SIMPLE_INTEGER := 2;
   begints   timestamp;
   endts     timestamp;
BEGIN
   begints := SYSTIMESTAMP;

   FOR cnt IN 1 .. iterations
   LOOP
      EXIT WHEN int1 = 2147483647;
--      int1 := int1 + int2 * cnt;
      int1 := int1 + 1;
   END LOOP;

   endts := SYSTIMESTAMP;
   DBMS_OUTPUT.put_line(   iterations
                        || ' iterations had run time of:'
                        || TO_CHAR (endts - begints));
END;
/

-- First recompile the procedures to as interpreted
ALTER PROCEDURE pls_test COMPILE PLSQL_CODE_TYPE=INTERPRETED
/
ALTER PROCEDURE simple_test COMPILE PLSQL_CODE_TYPE=INTERPRETED
/

-- Call each procedure one billion times; compare the run times
BEGIN
   pls_test (1000000000);
END;
/
BEGIN
   simple_test (1000000000);
END;
/

-- Recompile with to native code
ALTER PROCEDURE pls_test COMPILE PLSQL_CODE_TYPE=NATIVE
/
ALTER PROCEDURE simple_test COMPILE PLSQL_CODE_TYPE=NATIVE
/

-- Call each procedure one billion times; compare the run times
BEGIN
   pls_test (1000000000);
END;
/
BEGIN
   simple_test (1000000000);
END;
/
