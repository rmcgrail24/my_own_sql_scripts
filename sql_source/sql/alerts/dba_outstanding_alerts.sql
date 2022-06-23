column object_name format a40

ttitle center '***** DBA_OUTSTANDING_ALERTS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sequence_id,
       object_type,
       object_name
  FROM dba_outstanding_alerts
ORDER BY sequence_id;

clear columns
ttitle off

