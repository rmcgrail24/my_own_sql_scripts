column os_username format a15
column username    format a15
column userhost    format a25
column obj_name    format a30

ttitle center '***** DBA_AUDIT_OBJECT View *****' -
       right 'Page: ' format 99 sql.pno skip 2


SELECT os_username,
       username,
       userhost,
       timestamp,
       owner,
       obj_name,
       action_name
  FROM dba_audit_object
WHERE rownum < 10;

clear columns
ttitle off

