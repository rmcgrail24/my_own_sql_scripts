column value format 9,999,999,999 hea Microseconds

ttitle center '***** V$SESS_TIME_MODEL View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$sess_time_model
ORDER BY sid, stat_name;

clear columns
ttitle off

