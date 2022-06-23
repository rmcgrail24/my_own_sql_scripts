/* PL/SQL treats any zero-length string like a NULL value. This includes values returned by character functions and BOOLEAN expressions.
   For example, the following statements assign nulls to the target variables: */

DECLARE
   null_string  VARCHAR2(80) := TO_CHAR('');
   address      VARCHAR2(80);
   zip_code     VARCHAR2(80) := SUBSTR(address, 25, 0);
   name         VARCHAR2(80);
   valid        BOOLEAN      := (name != '');
BEGIN
  NULL;
END;
/

