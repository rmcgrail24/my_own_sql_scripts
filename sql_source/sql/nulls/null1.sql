/* In this example, we might expect the sequence of statements to execute because x and y seem unequal. But, NULL values are indeterminate.
   Whether x is equal to y is unknown. Therefore, the IF condition yields NULL and the sequence of statements is bypassed.  */
DECLARE
   x NUMBER := 5;
   y NUMBER := NULL;
BEGIN
   IF x != y THEN  -- yields NULL, not TRUE
     DBMS_OUTPUT.PUT_LINE('x != y');  -- not executed
   ELSIF x = y THEN -- also yields NULL
     DBMS_OUTPUT.PUT_LINE('x = y');
   ELSE
     DBMS_OUTPUT.PUT_LINE
       ('Can''t tell if x and y are equal or not.');
   END IF;
END;
/

