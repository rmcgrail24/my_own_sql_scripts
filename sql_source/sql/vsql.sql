column process format a7
column client_identifier format a20
column optimizer_mode hea 'Optimizer|Mode'

ttitle center '***** V$SQL_PLAN View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sql_id,
       sql_text,
--       sql_fulltext,
       optimizer_mode,
       parsing_user_id,
       plan_hash_value,
       hash_value,
       service,
       module,
       action,
       last_active_time       
  FROM v$sql
 WHERE sql_text LIKE '%email%'
ORDER BY sql_id;

clear columns
ttitle off

