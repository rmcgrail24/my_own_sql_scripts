CREATE PACKAGE personnel AS
   TYPE staff_list IS TABLE OF employees.employee_id%TYPE;
   PROCEDURE award_bonuses (empleos_buenos IN staff_list);
END personnel;
/
CREATE PACKAGE BODY personnel AS
 PROCEDURE award_bonuses (empleos_buenos staff_list) IS
  BEGIN
    FOR i IN empleos_buenos.FIRST..empleos_buenos.LAST
    LOOP
     UPDATE employees SET salary = salary + 100
         WHERE employees.employee_id = empleos_buenos(i);
   END LOOP;
  END;
 END;
/

prompt Now invoke the procedure personnel.award_bonuses:

DECLARE
  good_employees personnel.staff_list;
BEGIN
  good_employees :=  personnel.staff_list(100, 103, 107);
  personnel.award_bonuses (good_employees);
END;
/
