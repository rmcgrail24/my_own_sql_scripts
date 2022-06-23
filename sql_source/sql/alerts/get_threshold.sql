DECLARE
    warning_operator         BINARY_INTEGER;
    warning_value            VARCHAR2(60);
    critical_operator        BINARY_INTEGER; 
    critical_value           VARCHAR2(60);
    observation_period       BINARY_INTEGER;
    consecutive_occurrences  BINARY_INTEGER;
BEGIN
    DBMS_SERVER_ALERT.GET_THRESHOLD(DBMS_SERVER_ALERT.CPU_TIME_PER_CALL,
                                    warning_operator,
                                    warning_value,
                                    critical_operator,
                                    critical_value,
                                    observation_period, 
                                    consecutive_occurrences,
                                    instance_name => 'skagway',
                                    object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_SERVICE,
                                    object_name => 'skagway.werewolf.muirfield.com');

    DBMS_OUTPUT.PUT_LINE('Warning operator:       ' || warning_operator);
    DBMS_OUTPUT.PUT_LINE('Warning value:          ' || warning_value);
    DBMS_OUTPUT.PUT_LINE('Critical operator:      ' || critical_operator);
    DBMS_OUTPUT.PUT_LINE('Critical value:         ' || critical_value);     
    DBMS_OUTPUT.PUT_LINE('Observation_period:     ' || observation_period);
    DBMS_OUTPUT.PUT_LINE('Consecutive occurrences:' || consecutive_occurrences);
END;
/

