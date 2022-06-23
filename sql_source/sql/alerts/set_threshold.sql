BEGIN
   DBMS_SERVER_ALERT.SET_THRESHOLD(metrics_id => DBMS_SERVER_ALERT.CPU_TIME_PER_CALL,
                                   warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
                                   warning_value => '8000', 
                                   critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
                                   critical_value => '10000',
                                   observation_period => 1,
                                   consecutive_occurrences => 2,
                                   instance_name => 'skagway',
                                   object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_SERVICE,
                                   object_name => 'skagway.werewolf.muirfield.com');
END;
/

