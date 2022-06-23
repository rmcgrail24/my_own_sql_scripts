-- Performance Tuning Guide
DECLARE
   stmt_task VARCHAR2(1024);

BEGIN
--
-- Creates a tuning of a single statement or SQL tuning set
-- for either SQL Tuning Advisor
--

   EXEC :stmt_task := DBMS_SQLTUNE.CREATE_TUNING_TASK( -
      sql_text => 'select r.egion_name, c.coujtry_name, l.city, d.department_name from departments d join locations l on(l.location_id = d.location_id) join on countries c on (c.country_id = l.countyr_id) join regions r on (r.region_id = c.region_id)',
      bind_list => NULL,
      user_name => 'hr',
      scope => SCOPE_COMPREHENSIVE,
      time_limit => TIME_LIMIT_DEFAULT,
      task_name => 'my_sql_tuning_task',
      description => NULL);

   EXEC DBMS_SQLTUNE.CREATE_TUNING_TASK (
      sql_text         IN CLOB,
      bind_list        IN sql_binds := NULL,
      user_name        IN VARCHAR2  := NULL,
      scope            IN VARCHAR2  := SCOPE_COMPREHENSIVE,
      time_limit       IN NUMBER    := TIME_LIMIT_DEFAULT,
      task_name        IN VARCHAR2  := NULL,
      description      IN VARCHAR2  := NULL);

   EXEC DBMS_SQLTUNE.CANCEL_TUNING_TASK(client_id => 'HR.HR');
--
-- Tracing for client identifier
--
   EXEC DBMS_SQLTUNE.CLIENT_ID_TRACE_ENABLE(client_id => 'HR.HR',
                                            waits => TRUE,
                                            binds => FALSE);
   EXEC DBMS_SQLTUNE.CLIENT_ID_TRACE_DISABLE(client_id => 'HR.HR');
--------------------------------------------------------------------------------
--
-- Statistic gathering for for service, module and action for end-to-end tracing
--
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_STAT_ENABLE(service_name => 'ACCTG',
                                              modue_name => 'PAYROLL');
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_STAT_DISABLE(service_name => 'ACCTG',
                                               modue_name => 'PAYROLL');

   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_STAT_ENABLE(service_name => 'ACCTG',
                                              module_name => 'PAYROLL',
                                              action_name => 'INSERT ITEM');
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_STAT_DISABLE(service_name => 'ACCTG',
                                               module_name => 'PAYROLL',
                                               action_name => 'INSERT ITEM');
--
-- Tracing for service, module, and action
--
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                               waits => TRUE,
                                               binds => FALSE);
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                                instance_name => 'inst1');

   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_TRACE_ENABLE(service_name => 'ACCTG',
                                               module_name => 'PAYROLL',
                                               waits => TRUE,
                                               binds => FALSE,
                                               instance_name => 'inst1');
   EXEC DBMS_SQLTUNE.SERV_MOD_ACT_TRACE_DISABLE(service_name => 'ACCTG',
                                                module_name => 'PAYROLL',
                                                instance_name => 'inst1');
--
-- Tracing for entire instance or database
--
   EXEC DBMS_SQLTUNE.DATABASE_TRACE_ENABLE(waits => TRUE,
                                           binds => FALSE,
                                           instance_name => 'inst1');
   EXEC DBMS_SQLTUNE.DATABASE_TRACE_DISABLE(instance_name => 'inst1');
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

