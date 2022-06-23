DECLARE
   beyond_range       EXCEPTION;
   PRAGMA EXCEPTION_INIT(beyond_range,-1426);

   stmt_no           NATURALN := 1;
   v1                PLS_INTEGER;
   v2                PLS_INTEGER;

   checkout          TIMESTAMP(3);

   right_now         TIMESTAMP;
   yesterday         TIMESTAMP;
   sometime          TIMESTAMP;
   sts               TIMESTAMP; -- SYSTEIMESTAMP
   scn1              INTEGER;
   scn2              INTEGER;
   scn3              INTEGER;

   new_right_now_1   TIMESTAMP(9) WITH TIME ZONE;
   new_right_now_2   TIMESTAMP(9) WITH LOCAL TIME ZONE;

   lag_time          INTERVAL DAY(3) TO SECOND(3);
BEGIN
   v1 := -2147483648;
   DBMS_OUTPUT.PUT_LINE('The value of v1 is ' || v1);
   stmt_no := 2;
   v2 := 2147483647;
   DBMS_OUTPUT.PUT_LINE('The value of v2 is ' || v2);

   stmt_no := 3;
   checkout := '22-JUN-2004 07:48:53.275';
   DBMS_OUTPUT.PUT_LINE('The value of checkout is ' || TO_CHAR(checkout));

   stmt_no := 4;
   right_now := SYSTIMESTAMP;
   scn1 := TIMESTAMP_TO_SCN(right_now);
   DBMS_OUTPUT.PUT_LINE('The value of right_now is ' || right_now || ', the current SCN is ' || scn1);
  
   stmt_no := 5;
   yesterday := right_now - 1;
   scn2 := TIMESTAMP_TO_SCN(yesterday);
   DBMS_OUTPUT.PUT_LINE('The value of yesterday is ' || yesterday || ', the SCN from yesterday is ' || scn2);
  
-- Find arbitrary SCN between yesterday and today
 
   stmt_no := 6;
   scn3 := (scn1 + scn2) / 2;
   sometime := SCN_TO_TIMESTAMP(scn3);
   DBMS_OUTPUT.PUT_LINE('SCN ' || scn3 || ' was in effect at ' || TO_CHAR(sometime));

   stmt_no := 7;
   sts := SYSTIMESTAMP;
   DBMS_OUTPUT.PUT_LINE('The value of SYSTIMESTAMP is ' || TO_CHAR(sts));

   stmt_no := 8;
--   new_right_now_1 := '10-OCT-2004 09:42:37.114 AM +02:00';
   new_right_now_1 := SYSTIMESTAMP;
   DBMS_OUTPUT.PUT_LINE('The value of new_right_now_1 (TIMESTAMP WITH TIME ZONE) is ' || TO_CHAR(new_right_now_1));

   stmt_no := 9;
--   new_right_now_2 := '10-OCT-2004 09:42:37.114 AM';
   new_right_now_2 := SYSTIMESTAMP;
   DBMS_OUTPUT.PUT_LINE('The value of new_right_now_2 (TIMESTAMP WITH LOCAL TIME ZONE) is ' || TO_CHAR(new_right_now_2));

   stmt_no := 10;
   lag_time := '7 09:24:30';
   IF lag_time > INTERVAL '6' DAY THEN
      DBMS_OUTPUT.PUT_LINE('Greater than 6 days');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Less than 6 days');
   END IF;
EXCEPTION
   WHEN beyond_range THEN
      DBMS_OUTPUT.PUT_LINE('Out of bounds error in assignment statement ' || stmt_no);
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Unhandled exception!');
END;
/

