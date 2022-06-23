DECLARE
  TYPE IdsTab IS TABLE OF employees.employee_id%TYPE;
  TYPE NameTab IS TABLE OF employees.last_name%TYPE;
  ids  IdsTab;
  names NameTab;
  CURSOR c1 IS
    SELECT employee_id, last_name
     FROM employees
     WHERE job_id = 'ST_CLERK';
BEGIN
  OPEN c1;
  FETCH c1 BULK COLLECT INTO ids, names;
  CLOsE c1;
-- Here is where you process the elements in the collections
  FOR i IN ids.FIRST .. ids.LAST
    LOOP
      IF ids(i) > 140 THEN
          DBMS_OUTPUT.PUT_LINE( ids(i) );
       END IF;
    END LOOP;
  FOR i IN names.FIRST .. names.LAST
    LOOP
      IF names(i) LIKE '%Ma%' THEN
          DBMS_OUTPUT.PUT_LINE( names(i) );
       END IF;
    END LOOP;
END;
/
