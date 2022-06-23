DECLARE
   v_low_snap_id    NUMBER;
   v_high_snap_id   NUMBER;
   v_dbid           NUMBER DEFAULT NULL;
BEGIN
   v_low_snap_id := 896;
   v_high_snap_id := 900;

   DBMS_WORKLOAD_REPOSITORY.DROP_SNAPSHOT_RANGE(low_snap_id => v_low_snap_id,
                                                 high_snap_id => v_high_snap_id
--                                               dbid => v_dbid
                                                );
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at dropping snapshots from ' || v_low_snap_id || ' to ' || v_high_snap_id || ' failed!'); 
END;
/

