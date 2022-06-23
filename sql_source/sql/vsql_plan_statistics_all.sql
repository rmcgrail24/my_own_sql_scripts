column process format a7
column client_identifier format a20

ttitle center '***** V$SQL_PLAN_STATISTICS_ALL View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT address,
       hash_value,
       sql_id,
       plan_hash_value,
       output_rows,
       elapsed_time
  FROM v$sql_plan_statistics_all;

clear columns
ttitle off

