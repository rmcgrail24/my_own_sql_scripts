ttitle center '***** V$SESSION_EVENT View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sid,
       event,
       total_waits,
       total_timeouts,
       time_waited,
       average_wait,
       max_wait,
       time_waited_micro,
       event_id,
       wait_class_id,
       wait_class#,
       wait_class
  FROM v$session_event
ORDER BY event;

ttitle off

