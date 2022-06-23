column metric_name format a50
column metric_unit format a50

ttitle center '***** V$SYSMETRIC_HISTORY View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT begin_time,
       end_time,
       metric_name,
       value,
       metric_unit
  FROM v$sysmetric_history
ORDER BY metric_name;

clear columns
ttitle off

