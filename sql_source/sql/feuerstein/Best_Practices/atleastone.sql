SET VERIFY OFF
@ssoo
DECLARE
/* Different approaches to answering "at least one?" */
   CURSOR empcur
   IS
      SELECT employee_id
        FROM employee_big WHERE department_id = &&secondparm;
   v NUMBER;
   b BOOLEAN;
BEGIN
   plvtmr.set_factor (&&firstparm);
   plvtmr.capture;
   FOR i IN 1 .. &&firstparm
   LOOP
      BEGIN
         SELECT employee_id INTO v FROM employee_big 
          WHERE department_id = &&secondparm;
         b := TRUE;
      EXCEPTION
         WHEN NO_DATA_FOUND THEN b := FALSE;
         WHEN TOO_MANY_ROWS THEN b := TRUE;
      END;
   END LOOP;
   PLVtmr.show_elapsed ('Implicit');

   plvtmr.capture;
   FOR i IN 1 .. &&firstparm
   LOOP
      OPEN empcur;
      FETCH empcur INTO v;
      b := empcur%FOUND;
      CLOSE empcur;
   END LOOP;
   PLVtmr.show_elapsed ('Explicit');

   plvtmr.capture;
   FOR i IN 1 .. &&firstparm
   LOOP
      SELECT COUNT(*) INTO v 
        FROM employee_big WHERE department_id = &&secondparm;
      b := v > 0;
   END LOOP;
   PLVtmr.show_elapsed ('COUNT');

   /* Ohio OUG Contributions.... */
   plvtmr.capture;
   FOR i IN 1 .. &&firstparm
   LOOP
      SELECT COUNT(1) INTO v 
        FROM employee_big WHERE department_id = &&secondparm
         AND ROWNUM < 2;
      b := v > 0;
   END LOOP;
   PLVtmr.show_elapsed ('COUNT ROWNUM<2');

   /* Quest seminar UK 10/99 */
   plvtmr.capture;
   FOR i IN 1 .. &&firstparm
   LOOP
      SELECT NULL INTO v FROM dual WHERE
         EXISTS (SELECT 'x' FROM employee_big 
                  WHERE department_id = &&secondparm);
      b := v IS NOT NULL;
   END LOOP;
   PLVtmr.show_elapsed ('EXISTS');
/*
SQL>  @atleastone 1000 20
Implicit Elapsed: .45 seconds. Factored: .00045 seconds.
Explicit Elapsed: .12 seconds. Factored: .00012 seconds.
COUNT Elapsed: 2.21 seconds. Factored: .00221 seconds.
COUNT ROWNUM<2 Elapsed: .1 seconds. Factored: .0001 seconds.
EXISTS Elapsed: .14 seconds. Factored: .00014 seconds.

SQL>  @atleastone 20000 20
Implicit Elapsed: 8.06 seconds. Factored: .0004 seconds.
Explicit Elapsed: 2.46 seconds. Factored: .00012 seconds.
COUNT Elapsed: 42.21 seconds. Factored: .00211 seconds.
COUNT ROWNUM<2 Elapsed: 2.42 seconds. Factored: .00012 seconds.
EXISTS Elapsed: 2.63 seconds. Factored: .00013 seconds.
*/
END;
/
