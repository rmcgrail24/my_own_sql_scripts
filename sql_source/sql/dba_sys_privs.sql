ttitle center '***** DBA_SYS_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM dba_sys_privs
ORDER BY grantee;

ttitle off

