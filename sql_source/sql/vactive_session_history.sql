ttitle center '***** V$ACTIVE_SESSION_HISTORY View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT session_id,
       sample_time,
       sql_id,
       session_state,
       module
  FROM v$active_session_history
 WHERE event != 'null event'
ORDER BY session_id;

ttitle off

