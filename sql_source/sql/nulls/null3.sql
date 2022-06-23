/* Applying the logical operator NOT to a null yields NULL. Therefore, the following two IF statements are not always equivalent: */
DECLARE
   x    INTEGER := 2;
   Y    INTEGER := 5;
   high INTEGER;
BEGIN
   IF x > y THEN high := x;
   ELSE high := y;
   END IF;
   DBMS_OUTPUT.PUT_LINE('The value of high is ' || high);
 
   IF NOT x > y THEN high := y;
   ELSE high := x;
   END IF;
   DBMS_OUTPUT.PUT_LINE('The value of high is ' || high);

   /* The sequence of statements in the ELSE clause is executed when the IF condition yields FALSE or NULL.
      If neither x nor y is null, both IF statements assign the same value to high.
      However, if either x or y is null, the first IF statement assigns the value of y to high,
      but the second IF statement assigns the value of x to high.
   */ 

   x := NULL;
   IF x > y THEN high := x;
   ELSE high := y;
   END IF;
   DBMS_OUTPUT.PUT_LINE('The value of high is ' || high);

   IF NOT x > y THEN high := y;
   ELSE high := x;
   END IF;
   DBMS_OUTPUT.PUT_LINE('The value of high is ' || high);
END;
/

