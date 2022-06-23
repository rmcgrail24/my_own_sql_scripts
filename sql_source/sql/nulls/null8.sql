/* If its third argument is NULL, REPLACE returns its first argument with every occurrence of its second argument removed.
   For example, the call to REPLACE in this example removes all the dashes from dashed_string, instead of changing them to another character. */

DECLARE
  string_type  VARCHAR2(60);
  dashed       string_type%TYPE := 'Gold-i-locks';
 
  -- When the substitution text for REPLACE is NULL,
  -- the text being replaced is deleted.

  name         string_type%TYPE := REPLACE(dashed, '-', NULL);
BEGIN
   DBMS_OUTPUT.PUT_LINE('Dashed name    = ' || dashed);
   DBMS_OUTPUT.PUT_LINE('Dashes removed = ' || name);
END;
/

