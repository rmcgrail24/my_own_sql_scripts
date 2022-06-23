-- Performance Tuning Guide

DECLARE
   start_profiler_rc      BINARY_INTEGER;
   stop_profiler_rc       BINARY_INTEGER;
BEGIN
   EXEC DBMS_TRACE.CLIENT_ID_TRACE_ENABLE(client_id => 'HR.HR',
                                          waits => TRUE,
                                          binds => FALSE);
   EXEC DBMS_TRACE.CLIENT_ID_TRACE_DISABLE(client_id => 'HR.HR');

----------------
   EXEC DBMS_TRACE.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                          waits => TRUE,
                                          binds => FALSE,
                                          instance_name => 'inst1');
   EXEC DBMS_TRACE.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                              instance_name => 'inst1');

   EXEC DBMS_TRACE.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                             module_name => 'PAYROLL',
                                             waits => TRUE,
                                             binds => FALSE,
                                             instance_name => 'inst1');
   EXEC DBMS_TRACE.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                              module_name => 'PAYROLL',
                                              instance_name => 'inst1');

-------------------------
   EXEC DBMS_TRACE.SESSION_TRACE_ENABLE(session_id => 27,
                                        serial_num => 60,
                                        waits => TRUE,
                                        binds => FALSE);
   EXEC DBMS_TRACE.SESSION_TRACE_DISABLE(session_id => 27,
                                         serial_num => 60);

   EXEC DBMS_TRACE.SESSION_TRACE_ENABLE(service_name => 'ACCTG',
                                             module_name => 'PAYROLL',
                                             waits => TRUE,
                                             binds => FALSE,
                                             instance_name => 'inst1');
   EXEC DBMS_TRACE.SESSION_TRACE_DISABLE(service_name => 'ACCTG',
                                              module_name => 'PAYROLL',
                                              instance_name => 'inst1');
EXCEPTION
   NULL;
END;
/

