-- Performance Tuning Guide

DECLARE
   start_profiler_rc      BINARY_INTEGER;
   stop_profiler_rc       BINARY_INTEGER;
BEGIN
   start_profiler_rc := DBMS_PROFILE.START_PROFILER('run comment', 'run comment2');
   stop_profiler_rc  := DBMS_PROFILE.START_PROFILER('run comment', 'run comment2');
EXCEPTION
   NULL;
END;
/

