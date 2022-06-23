column process format a7
column client_identifier format a20

ttitle center '***** V$SQL_PLAN View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT address,
       hash_value,
       sql_id,
       plan_hash_value
  FROM v$sql_plan;

clear columns
ttitle off

