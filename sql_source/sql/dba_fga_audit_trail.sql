column os_user  format a15
column db_user  format a15
column username format a15
column userhost format a15
column object_schema format a30
column object_name format a30


SELECT db_user,
       os_user,
       userhost,
       timestamp,
       object_schema,
       object_name,
       policy_name,
       sql_text
  FROM dba_fga_audit_trail;

