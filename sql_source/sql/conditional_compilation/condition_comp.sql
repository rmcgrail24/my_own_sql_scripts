ALTER SESSION SET PLSQL_CCFLAGS = 'my_debug:FALSE, my_tracing:FALSE';

CREATE OR REPLACE PACKAGE my_pkg AS
  SUBTYPE my_real IS
     $IF DBMS_DB_VERSION.VERSION < 10 $THEN
        NUMBER;
     -- Check database version
     $ELSE
        BINARY_DOUBLE;
     $END

     my_pi my_real;
     my_e my_real;
END my_pkg;
/

CREATE OR REPLACE PACKAGE BODY my_pkg AS
BEGIN
   -- Set values for future calculations based on DB version

    $IF DBMS_DB_VERSION.VERSION < 10 $THEN
       my_pi := 3.14159265358979323846264338327950288420;
       my_e  := 2.71828182845904523536028747135266249775;
    $ELSE
       my_pi := 3.14159265358979323846264338327950288420d;
      my_e  := 2.71828182845904523536028747135266249775d;
    $END
END my_pkg;
/

CREATE OR REPLACE PROCEDURE circle_area(radius my_pkg.my_real) IS
   my_area      my_pkg.my_real;
   my_data_type  VARCHAR2(30);
BEGIN
   my_area := my_pkg.my_pi * radius;
 
   DBMS_OUTPUT.PUT_LINE('Radius: ' || TO_CHAR(radius) || ' Area: ' || TO_CHAR(my_area));
 
   $IF $$my_debug $THEN
      -- If my_debug is TRUE, run debugging code
      SELECT DATA_TYPE INTO my_data_type
        FROM USER_ARGUMENTS
        WHERE OBJECT_NAME = 'CIRCLE_AREA'
          AND ARGUMENT_NAME = 'RADIUS';
 
      DBMS_OUTPUT.PUT_LINE('Data type of the RADIUS argument is: ' || my_data_type);
   $END
END;
/

CALL DBMS_PREPROCESSOR.PRINT_POST_PROCESSED_SOURCE('PACKAGE', 'HR', 'MY_PKG');

