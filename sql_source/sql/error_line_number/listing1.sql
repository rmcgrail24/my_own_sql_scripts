CREATE OR REPLACE PROCEDURE proc1 IS
BEGIN
   DBMS_OUTPUT.put_line('running proc1');
   RAISE NO_DATA_FOUND;
END;
/
CREATE OR REPLACE PROCEDURE proc2 IS
BEGIN
   DBMS_OUTPUT.put_line('running proc2');
   DBMS_OUTPUT.put_line('calling proc1');
   proc1;
END;
/
CREATE OR REPLACE PROCEDURE proc3 IS
BEGIN
   DBMS_OUTPUT.put_line('running proc3');
   DBMS_OUTPUT.put_line('calling proc2');
   proc2;
END;
/
