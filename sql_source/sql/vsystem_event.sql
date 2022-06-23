ttitle center '***** V$SYSTEM_EVENT View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT event,
       total_waits,
       total_timeouts,
       time_waited,
       average_wait,
       time_waited_micro,
       total_waits_fg,
       total_timeouts_fg,
       time_waited_fg,
       average_wait_fg,
       time_waited_micro_fg,
       event_id,
       wait_class_id,
       wait_class#,
       wait_class
  FROM v$system_event
ORDER BY event;

ttitle off

