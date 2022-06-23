CREATE OR REPLACE PROCEDURE show_birthdays (
      second_row IN INTEGER)
IS
   TYPE date_table IS 
       TABLE OF DATE INDEX BY BINARY_INTEGER;
   birthdays date_table;
   v_row PLS_INTEGER;
BEGIN
   pl ('');
   pl ('Show Birthdays, Second Row = ' || second_row);
   
   birthdays(1) := '20-mar-72';
   birthdays(second_row) := '01-oct-86';

   plvtmr.capture;
   FOR rowind IN 
      NVL (birthdays.FIRST, 0) .. 
      NVL (birthdays.LAST, -1)
   LOOP
      IF birthdays.EXISTS (rowind)
      THEN
         DBMS_OUTPUT.PUT_LINE (birthdays(rowind));
      END IF;
   END LOOP;
   plvtmr.show_elapsed ('EXISTS');

   plvtmr.capture;
   FOR rowind IN NVL (birthdays.FIRST, 0) .. NVL (birthdays.LAST, -1)
   LOOP
      BEGIN
         DBMS_OUTPUT.PUT_LINE (birthdays(rowind));
      EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
      END;
   END LOOP;
   plvtmr.show_elapsed ('EXC');

   plvtmr.capture;
   v_row := birthdays.FIRST;
   LOOP
      EXIT WHEN v_row IS NULL;
      DBMS_OUTPUT.PUT_LINE (birthdays(v_row));
      v_row := birthdays.NEXT (v_row);
   END LOOP;
   plvtmr.show_elapsed ('NEXT');
END;
/

BEGIN
   show_birthdays (2);
   show_birthdays (100);
   show_birthdays (100000);
   show_birthdays (1000000);
END;
/
