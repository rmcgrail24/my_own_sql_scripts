DECLARE
   v_start_snap_id          NUMBER := 916;
   v_end_snap_id            NUMBER := 917;
   v_baseline_name          VARCHAR2(60) := 'baseline_manual_1';
   v_dbid                   NUMBER DEFAULT NULL;
   v_expiration             NUMBER DEFAULT NULL;
   v_baseline_number        NUMBER;
BEGIN
   v_baseline_number := DBMS_WORKLOAD_REPOSITORY.CREATE_BASELINE(start_snap_id => v_start_snap_id,
                                                                 end_snap_id => v_end_snap_id,
                                                                 baseline_name => v_baseline_name);
--                                                                 v_dbid,
--                                                                 v_expiration)

   DBMS_OUTPUT.PUT_LINE('The new baseline number is ' || v_baseline_number);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at creating fixed baseline ' || v_baseline_name || ' failed!');
END;
/

