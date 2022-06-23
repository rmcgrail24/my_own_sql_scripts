column object_name format a50
column reason format a50

ttitle center '***** DBA_ALERT_HISTORY View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sequence_id,
       reason_id,
       object_name,
       reason,
--       object_type,
       resolution
  FROM dba_alert_history
ORDER BY sequence_id;

clear columns
ttitle off

