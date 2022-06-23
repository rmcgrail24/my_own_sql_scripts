DECLARE
   date1   DATE;
   date2   TIMESTAMP;
   date3   TIMESTAMP ( 9 );
   date4   TIMESTAMP WITH TIME ZONE;
   date5   TIMESTAMP ( 9 ) WITH TIME ZONE;
   date6   TIMESTAMP WITH LOCAL TIME ZONE;
   date7   TIMESTAMP ( 9 ) WITH LOCAL TIME ZONE;
BEGIN
   SELECT SYSDATE, SYSDATE, SYSDATE, SYSDATE, SYSDATE, SYSDATE, SYSDATE
     INTO date1, date2, date3, date4, date5, date6, date7
     FROM DUAL;

   DBMS_OUTPUT.put_line ('Value of date1 is ' || date1);
   DBMS_OUTPUT.put_line ('Value of date2 is ' || date2);
   DBMS_OUTPUT.put_line ('Value of date3 is ' || date3);
   DBMS_OUTPUT.put_line ('Value of date4 is ' || date4);
   DBMS_OUTPUT.put_line ('Value of date5 is ' || date5);
   DBMS_OUTPUT.put_line ('Value of date6 is ' || date6);
   DBMS_OUTPUT.put_line ('Value of date7 is ' || date7);
END;
/

