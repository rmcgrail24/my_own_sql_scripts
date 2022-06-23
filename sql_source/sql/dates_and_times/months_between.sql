SELECT MONTHS_BETWEEN
         (TO_DATE('02-02-1995','MM-DD-YYYY'),
          TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months"
  FROM DUAL;

SELECT MONTHS_BETWEEN
         (TO_DATE('01-01-1995','MM-DD-YYYY'), TO_DATE('02-02-1995','M
  FROM DUAL;

SELECT MONTHS_BETWEEN ('5-apr-14', '24-may-14') "Months" from dual;

SELECT MONTHS_BETWEEN ('24-may-14', '7-jan-14') "Months" from dual;

SELECT MONTHS_BETWEEN ('31-may-14', '28-jan-14') "Months" from dual;

SELECT MONTHS_BETWEEN ('31-may-14', '28-feb-14') "Months" from dual;

SELECT MONTHS_BETWEEN ('29-feb-08', to_date('28-feb-2008 12:00:00', 'dd-mon-yyyy hh24:mi:ss')) * 31 "Months" from dual;

