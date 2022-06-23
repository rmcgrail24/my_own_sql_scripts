DECLARE
   start_snap_id   NUMBER;
   end_snap_id     NUMBER;
   baseline_name   VARCHAR2(30);
   dbid            NUMBER DEFAULT NULL;
   expiration      NUMBER DEFAULT NULL;
BEGIN
   start_snap_id := &start_snap_id;
   end_snap_id   := &end_snap_id;
   baseline_name := '&baseline_name';
   dbid          := &dbid;
   expiration    := &expiration;
/*
   EXECUTE DBMS_WORKLOAD_REPOSITORY.CREATE_BASELINE(start_snap_id => 105,
                                                    end_snap_id => 107,
                                                    baseline_name => 'oltp_peakload_bl',
                                                    dbid => NULL,
                                                    expiration => 30);
*/
   EXECUTE DBMS_WORKLOAD_REPOSITORY.CREATE_BASELINE(start_snap_id => start_snap_id,
                                                    end_snap_id => end_snap_id,
                                                    baseline_name => LOWER('baseline_name'),
                                                    dbid => dbid,
                                                    expiration => expiration);
   dbms_output.put_line('start_snap_id = ' || start_snap_id);
   dbms_output.put_line('end_snap_id   = ' || end_snap_id);
   dbms_output.put_line('baseline_name = ' || baseline_name);
   dbms_output.put_line('dbid          = ' || dbid);
   dbms_output.put_line('expiration    = ' || expiration);
END;
/

