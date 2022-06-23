@@emplu.pkg
CREATE OR REPLACE PROCEDURE test_emplu (
   counter IN INTEGER, empno_in IN emp.empno%TYPE := 7788)
IS
   emprec employee%ROWTYPE;
BEGIN
   PLVtmr.set_factor (counter);
   PLVtmr.capture;
   FOR i IN 1 .. counter
   LOOP
      emprec := emplu1.onerow (empno_in);
   END LOOP;
   PLVtmr.show_elapsed ('database table');

   PLVtmr.set_factor (counter);
   PLVtmr.capture;
   FOR i IN 1 .. counter
   LOOP
      emprec := emplu2.onerow (empno_in);
   END LOOP;
   PLVtmr.show_elapsed ('index-by table');
END;
/
