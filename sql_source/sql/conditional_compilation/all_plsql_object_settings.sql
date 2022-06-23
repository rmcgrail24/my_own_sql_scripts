column owner format a20
column plsql_optimize_level format 999999
column plsql_code_type format a20
column plsql_debug format a11
column plsql_warnings format a30
column nls_length_semantics format a30
column plsql_ccflags format a30
column plscope_settings format a30

SELECT owner,
       name,
       type,
       plsql_optimize_level,
       plsql_code_type,
       plsql_ccflags
  FROM all_plsql_object_settings
 WHERE owner != 'SYS'
ORDER BY owner desc;

clear columns

