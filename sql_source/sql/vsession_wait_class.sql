column total_waits format 999,999,999
column total_waits_fg format 999,999,999

ttitle center '***** V$SESSION_WAIT_CLASS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sid,
       serial#,
       wait_class_id,
       wait_class#,
       wait_class,
       total_waits,
       time_waited
  FROM v$session_wait_class
ORDER BY wait_class#;

clear columns
ttitle off

