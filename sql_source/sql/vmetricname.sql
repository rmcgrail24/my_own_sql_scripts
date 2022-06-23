ttitle center '***** V$METRICNAME View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT group_id,
       metric_id,
       metric_name,
       metric_unit
  FROM v$metricname
ORDER BY metric_name
--ORDER BY group_id, metric_id
/
ttitle off

