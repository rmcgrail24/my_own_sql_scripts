BEGIN 
  DBMS_MONITOR.SERV_MOD_ACT_TRACE_ENABLE(
    service_name  => 'orclpdb1',
--    module_name   => 'SQL Developer',
    module_name   => 'TKPROF_TEST',
    waits         =>  true,
    binds         =>  FALSE,
    instance_name => 'orclcdb',
    plan_stat     => 'ALL_EXECUTIONS'
    );
END;

-- The following statement will fail!  Can't use named parameters
-- with the EXECUTE statement.
EXECUTE DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE(service_name  => 'orclpdb1',
                                                module_name   => 'TKPROF_TEST',
                                                action_name   => DBMS_MONITOR.ALL_ACTIONS,
                                                instance_name => 'orclcdb');

-- Named parameters work this way:
BEGIN 
   DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE(service_name  => 'orclpdb1',
                                           module_name   => 'TKPROF_TEST',
                                           action_name   => DBMS_MONITOR.ALL_ACTIONS,
                                           instance_name => 'orclcdb');
END;


