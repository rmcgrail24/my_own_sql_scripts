DECLARE
   v_baseline_name          VARCHAR2(60) := 'baseline_manual_1';
   v_cascade                BOOLEAN DEFAULT FALSE;
   v_dbid                   NUMBER DEFAULT NULL;
BEGIN
--   DBMS_WORKLOAD_REPOSITORY.DROP_BASELINE(v_baseline_name, FALSE);
   DBMS_WORKLOAD_REPOSITORY.DROP_BASELINE(baseline_name => v_baseline_name, v_cascade => v_cascade, v_dbid => v_dbid);

   DBMS_OUTPUT.PUT_LINE('Successfully dropped baseline ' || v_baseline_name);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at dropping baseline ' || v_baseline_name || '  failed!');
END;
/

