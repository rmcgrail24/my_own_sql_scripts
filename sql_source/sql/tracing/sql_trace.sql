col owner format a15;
col object_type format a15;
col object_name format a20;

ALTER SESSION SET TRACEFILE_IDENTIFIER = 'monday1';
ALTER SESSION SET TRACEFILE_IDENTIFIER = 'monday2';

EXEC DBMS_SESSION.SET_SQL_TRACE(sql_trace => true);

SELECT object_type, owner, object_name 
  FROM ALL_OBJECTS
ORDER BY 1, 3;

EXEC DBMS_SESSION.SET_SQL_TRACE(sql_trace => false);

exec tkprof_test;

----------------------------------

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

EXECUTE DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE('orclpdb1', 'TKPROF_TEST', DBMS_MONITOR.ALL_ACTIONS, 'orclcdb');
EXECUTE DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE('orclpdb1');
--EXECUTE DBMS_MONITOR.SERV_MOD_ACT_TRACE_DISABLE('orclpdb1', 'SQL Developer');

EXEC DBMS_MONITOR.DATABASE_TRACE_ENABLE(INSTANCE_NAME => 'ORCLPDB1');
EXEC DBMS_MONITOR.DATABASE_TRACE_DISABLE(INSTANCE_NAME => 'ORCLPDB1');
EXEC DBMS_MONITOR.DATABASE_TRACE_ENABLE(INSTANCE_NAME => 'orclcdb');
EXEC DBMS_MONITOR.DATABASE_TRACE_DISABLE(INSTANCE_NAME => 'orclcdb');
EXEC DBMS_MONITOR.DATABASE_TRACE_DISABLE();

tkprof orclcdb_dbrm_5664.trc output_trc.prf EXPLAIN=SYSTEM/rome432@localhost:1521/orclpdb1

sho user
