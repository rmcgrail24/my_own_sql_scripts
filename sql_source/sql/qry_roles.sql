SELECT grantee,
       owner,
       table_name,
       privilege,
       grantable
  FROM dba_tab_privs
 WHERE grantee IN ('USR_ROLE''MGR_ROLE')
UNION ALL
SELECT grantee,
       TO_CHAR(NULL),
       TO_CHAR(NULL),
       privilege,
       admin_option
  FROM dba_sys_privs
 WHERE grantee IN ('USR_ROLE''MGR_ROLE')
ORDER BY grantee;

