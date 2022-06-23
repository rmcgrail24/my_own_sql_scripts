BEGIN
   DBMS_OUTPUT.PUT_LINE(DBMS_HPROF.ANALYZE('USER_DIR', 'test3.trc',FALSE,NULL,1,NULL,'Analyzing the latest run of procedure TEST'));
END;
/


