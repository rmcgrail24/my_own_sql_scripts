BEGIN
  /* Start profiling.
     Write raw profiler output to file test2.trc in a directory
     that is mapped to directory object USER_DIR
     (see note following example). */

  DBMS_HPROF.START_PROFILING('USER_DIR', 'test2.trc');
END;
/
-- Execute procedure to be profiled
BEGIN
  hr.test2;
END;
/
BEGIN
  -- Stop profiling
  DBMS_HPROF.STOP_PROFILING;
END;
/
