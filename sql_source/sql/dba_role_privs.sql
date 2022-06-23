ttitle center '***** DBA_ROLE_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

break on grantee;

SELECT *
  FROM dba_role_privs
ORDER BY grantee;

clear breaks
ttitle off

