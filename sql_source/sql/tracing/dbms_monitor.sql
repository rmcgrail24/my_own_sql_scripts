-- Performance Tuning Guide

BEGIN
--
-- Statistic gathering for client identifier for end-to-end tracing
--
   EXEC DBMS_MONITOR.CLIENT_ID_STAT_ENABLE(client_id => 'HR.HR');
   EXEC DBMS_MONITOR.CLIENT_ID_STAT_DISABLE(client_id => 'HR.HR');
--
-- Tracing for client identifier
--
   EXEC DBMS_MONITOR.CLIENT_ID_TRACE_ENABLE(client_id => 'HR.HR',
                                            waits => TRUE,
                                            binds => FALSE);
   EXEC DBMS_MONITOR.CLIENT_ID_TRACE_DISABLE(client_id => 'HR.HR');
--------------------------------------------------------------------------------
--
-- Statistic gathering for for service, module and action for end-to-end tracing
--
   EXEC DBMS_MONITOR.SERV_MOD_ACT_STAT_ENABLE(service_name => 'ACCTG',
                                              modue_name => 'PAYROLL');
   EXEC DBMS_MONITOR.SERV_MOD_ACT_STAT_DISABLE(service_name => 'ACCTG',
                                               modue_name => 'PAYROLL');

   EXEC DBMS_MONITOR.SERV_MOD_ACT_STAT_ENABLE(service_name => 'ACCTG',
                                              module_name => 'PAYROLL',
                                              action_name => 'INSERT ITEM');
   EXEC DBMS_MONITOR.SERV_MOD_ACT_STAT_DISABLE(service_name => 'ACCTG',
                                               module_name => 'PAYROLL',
                                               action_name => 'INSERT ITEM');
--
-- Tracing for service, module, and action
--
   EXEC DBMS_MONITOR.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                               waits => TRUE,
                                               binds => FALSE);
   EXEC DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                                instance_name => 'inst1');

   EXEC DBMS_MONITOR.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                               module_name => 'PAYROLL',
                                               waits => TRUE,
                                               binds => FALSE,
                                               instance_name => 'inst1');
   EXEC DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                                module_name => 'PAYROLL',
                                                instance_name => 'inst1');
--
-- Tracing for entire instance or database
--
   EXEC DBMS_MONITOR.DATABASE_TRACE_ENABLE(waits => TRUE,
                                           binds => FALSE,
                                           instance_name => 'inst1');
   EXEC DBMS_MONITOR.DATABASE_TRACE_DISABLE(instance_name => 'inst1');
--------------------------------------------------------------------------------
--
-- Tracing for session
--
   EXEC DBMS_SESSION.SESSION_TRACE_ENABLE(waits => TRUE,
                                          binds => FALSE);
   EXEC DBMS_SESSION.SESSION_TRACE_DISABLE();
EXCEPTION
   NULL;
END;
/

