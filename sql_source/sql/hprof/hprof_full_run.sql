BEGIN
  /* Start profiling.
     Write raw profiler output to file test.trc in a directory
     that is mapped to directory object USER_DIR
     (see note following example). */

  DBMS_HPROF.START_PROFILING('USER_DIR', 'test3.trc');
END;
/
-- Execute procedure to be profiled
BEGIN
  hr.test;
END;
/
BEGIN
  -- Stop profiling
  DBMS_HPROF.STOP_PROFILING;
END;
/
