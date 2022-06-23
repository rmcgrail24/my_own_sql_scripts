ttitle center '***** V$EVENT_NAME View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT event#,
       event_id,
       name,
       wait_class_id,
       wait_class#,
       wait_class
  FROM v$event_name
ORDER BY event#;

ttitle off

