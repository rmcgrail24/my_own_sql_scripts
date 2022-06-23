/* In this example, you might expect the sequence of statements to execute because a and b seem equal.
   But, again, that is unknown, so the IF condition yields NULL and the sequence of statements is bypassed. */
DECLARE
   a NUMBER := NULL;
   b NUMBER := NULL;
BEGIN
   IF a = b THEN  -- yields NULL, not TRUE
     DBMS_OUTPUT.PUT_LINE('a = b');  -- not executed
   ELSIF a != b THEN  -- yields NULL, not TRUE
     DBMS_OUTPUT.PUT_LINE('a != b');  -- not executed
   ELSE
     DBMS_OUTPUT.PUT_LINE('Can''t tell if two NULLs are equal');
   END IF;
END;
/

