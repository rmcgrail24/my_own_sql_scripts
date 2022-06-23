CREATE OR REPLACE PROCEDURE assert (
   condition_in IN BOOLEAN,
   message_in IN VARCHAR2,
   raise_exception_in IN BOOLEAN := TRUE,
   exception_in IN VARCHAR2
         := 'VALUE_ERROR'
)
IS
BEGIN
   IF    NOT condition_in
      OR condition_in IS NULL
   THEN
      pl ('Assertion Failure!');
      pl (message_in);

      IF raise_exception_in
      THEN
         EXECUTE IMMEDIATE 
           'BEGIN RAISE ' || exception_in || '; END;';
      END IF;
   END IF;
END assert;
/