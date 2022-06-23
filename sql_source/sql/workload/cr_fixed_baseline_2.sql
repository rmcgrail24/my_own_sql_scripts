DECLARE
   v_start_time             DATE;
   v_end_start_time         DATE;
   v_baseline_name          VARCHAR2(60) := 'baseline_manual_1';
   v_dbid                   NUMBER DEFAULT NULL;
   v_expiration             NUMBER DEFAULT NULL;
   v_baseline_number        NUMBER;
BEGIN
   v_baseline_number := DBMS_WORKLOAD_REPOSITORY.CREATE_BASELINE(start_time => v_start_time,
                                                                 end_start_time => v_end_start_time,
                                                                 baseline_name => v_baseline_name);
--                                                                 v_dbid,
--                                                                 v_expiration)

   DBMS_OUTPUT.PUT_LINE('The new baseline number is ' || v_baseline_number);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at creating fixed baseline ' || v_baseline_name || ' failed!');
END;
/

