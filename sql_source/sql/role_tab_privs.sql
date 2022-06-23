column role format a20
column owner format a20
--column table_name format a20
column column_name format a20
column privilege format a20
column grantable format a20

ttitle center '***** ROLE_TAB_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM role_tab_privs
ORDER BY role;

clear columns
ttitle off

