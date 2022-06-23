column plsql_code_type format a30
column plsql_warnings format a30

ttitle center '***** ALL_PLSQL_OBJECT_SETTINGS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT owner,
       name,
       type,
       plsql_optimize_level,
       plsql_code_type
--       plsql_warnings
  FROM all_plsql_object_settings
ORDER By name;

clear columns
ttitle off

