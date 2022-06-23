DECLARE
    credit  PLS_INTEGER RANGE 1000..25000;
    debit   credit%TYPE;  -- inherits data type
  
    name        VARCHAR2(20) := 'JoHn SmItH';
    upper_name  name%TYPE;  -- inherits data type and default value
    lower_name  name%TYPE;  -- inherits data type and default value
    init_name   name%TYPE;  -- inherits data type and default value
BEGIN
    DBMS_OUTPUT.PUT_LINE ('name: ' || name);
    DBMS_OUTPUT.PUT_LINE ('upper_name: ' || UPPER(name));
    DBMS_OUTPUT.PUT_LINE ('lower_name: ' || LOWER(name));
    DBMS_OUTPUT.PUT_LINE ('init_name:  ' || INITCAP(name));

   credit := 1000;
   DBMS_OUTPUT.PUT_LINE ('credit: ' || credit);
   credit := 25000;
   DBMS_OUTPUT.PUT_LINE ('credit: ' || credit);
   debit := 1000;
   DBMS_OUTPUT.PUT_LINE ('debit: ' || debit);
   debit := 25000;
   DBMS_OUTPUT.PUT_LINE ('debit: ' || debit);
END;
/

