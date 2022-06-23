DECLARE
   snapshot_id    NUMBER;
BEGIN
   snapshot_id := DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();  -- 'TYPICAL' (default) or 'ALL'
--   snapshot_id := DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT('TYPICAL');
   DBMS_OUTPUT.PUT_LINE('The new snapshot ID is ' || snapshot_id);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at creating snapshot failed!'); 
END;
/

