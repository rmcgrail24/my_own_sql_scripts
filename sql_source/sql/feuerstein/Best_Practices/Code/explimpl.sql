SET VERIFY OFF
@ssoo
@explimpl.pkg
CREATE OR REPLACE PROCEDURE explimpl (
   id_in IN employee.employee_id%TYPE,
   counter_in IN PLS_INTEGER,
   outcome_in IN VARCHAR2)
IS     
   CURSOR empcur 
   IS 
      SELECT employee_id 
        FROM employee WHERE employee_id = id_in;
   v NUMBER;
   fname ei_pkg.fullname_t;
BEGIN
   plvtmr.set_factor (counter_in);
   
   plvtmr.capture;
   FOR i IN 1 .. counter_in
   LOOP
      BEGIN
         SELECT employee_id INTO v FROM employee WHERE employee_id = id_in;
      EXCEPTION
         WHEN OTHERS THEN NULL;
      END;
      v := v + 1;
   END LOOP;
   PLVtmr.show_elapsed (outcome_in || ' Implicit');

   plvtmr.capture;
   FOR i IN 1 .. counter_in
   LOOP
      OPEN empcur;
      FETCH empcur INTO v;
      v := v + 1;
      CLOSE empcur;
   END LOOP;
   PLVtmr.show_elapsed (outcome_in || ' Explicit');

   plvtmr.capture;
   FOR i IN 1 .. counter_in
   LOOP
      FOR rec IN empcur
      LOOP
         rec.employee_id := rec.employee_id + 1;
      END LOOP;
   END LOOP;
   PLVtmr.show_elapsed (outcome_in || ' CFL');
   
   p.l ('');
   
   plvtmr.capture;
   FOR i IN 1 .. counter_in
   LOOP
      fname := ei_pkg.i_empname (id_in);
   END LOOP;
   PLVtmr.show_elapsed (outcome_in || ' Implicit Function');

   plvtmr.capture;
   FOR i IN 1 .. counter_in
   LOOP
      fname := ei_pkg.e_empname (id_in);
   END LOOP;
   PLVtmr.show_elapsed (outcome_in || ' Explicit Function');

END;
/
exec explimpl (7600, 10000, 'Success');
exec explimpl (-7600, 10000, 'Failure');
REM exec explimpl (7600, 100000, 'Success');
REM exec explimpl (-7600, 100000, 'Failure');

