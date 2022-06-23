DECLARE
   v_true BOOLEAN := TRUE;
   v_false BOOLEAN := FALSE;
   v_null BOOLEAN;
   v_result BOOLEAN;
BEGIN
   DBMS_OUTPUT.PUT_LINE(' Condition X         Condition Y         Result');
   DBMS_OUTPUT.PUT_LINE(' ___________         ___________         ______');
   DBMS_OUTPUT.PUT_LINE('     FALSE        FALSE            FALSE');
   DBMS_OUTPUT.PUT_LINE('     FALSE        TRUE            FALSE');
   DBMS_OUTPUT.PUT_LINE('     FALSE        NULL            FALSE');
   DBMS_OUTPUT.PUT_LINE('     TRUE        FALSE            FALSE');
   DBMS_OUTPUT.PUT_LINE('     TRUE        TRUE            TRUE');
   DBMS_OUTPUT.PUT_LINE('     TRUE        NULL            NULL');
   DBMS_OUTPUT.PUT_LINE('     NULL        FALSE           FALSE'); 
   DBMS_OUTPUT.PUT_LINE('     NULL        TRUE           NULL'); 
   DBMS_OUTPUT.PUT_LINE('     NULL        NULL           NULL'); 
END;
.
/

