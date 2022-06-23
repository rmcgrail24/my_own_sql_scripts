column warning_value format a40
column critical_value format a40

ttitle center '***** DBA_THRESHOLDS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT metrics_name,
       warning_value,
       critical_value,
       status
  FROM dba_thresholds
ORDER BY metrics_name;

clear columns
ttitle off

