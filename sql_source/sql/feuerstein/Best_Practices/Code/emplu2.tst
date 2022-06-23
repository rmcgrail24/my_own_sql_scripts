SET VERIFY OFF
DECLARE
   timing PLS_INTEGER;
   emprec employee%ROWTYPE;
BEGIN
   timing := DBMS_UTILITY.GET_TIME;
   FOR i IN 1 .. &1
   LOOP
      emprec := emplu1.onerow (&2);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE ('database table ' || TO_CHAR (DBMS_UTILITY.GET_TIME - timing));

   timing := DBMS_UTILITY.GET_TIME;
   FOR i IN 1 .. &1
   LOOP
      emprec := emplu2.onerow (&2);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE ('index-by table ' || TO_CHAR (DBMS_UTILITY.GET_TIME - timing));
END;
/

