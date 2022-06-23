BEGIN
   DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS(retention => 43200,
                                                     interval => 30,
                                                     topnsql => 100,
                                                     dbid => NULL);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at modifying snapshot settings failed!'); 
END;
/

