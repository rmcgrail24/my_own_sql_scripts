/* The function REPLACE returns the value of its first argument if its second argument is NULL,
   regardless of whether the optional third argument is present.
   For example, the call to REPLACE in this example does not make any change to the value of old_string. */
DECLARE
  string_type  VARCHAR2(60);
  old_string   string_type%TYPE := 'Apples and oranges';
  v_string     string_type%TYPE := 'more apples';

  -- NULL is a valid argument to REPLACE,
  -- but does not match anything,
  -- so no replacement is done.

  new_string string_type%TYPE := REPLACE(old_string, NULL, v_string);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Old string = ' || old_string);
  DBMS_OUTPUT.PUT_LINE('New string = ' || new_string);
END;
/

