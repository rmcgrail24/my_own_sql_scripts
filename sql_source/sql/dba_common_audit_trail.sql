column os_user  format a15
column db_user  format a15
column username format a15
column userhost format a15
column object_schema format a30
column object_name format a30

ttitle center '***** DBA_COMMON_AUDIT_TRAIL View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT db_user,
       os_user,
       userhost,
       object_schema,
       object_name,
       policy_name,
       sql_text
  FROM dba_common_audit_trail;
  
clear columns
ttitle off


