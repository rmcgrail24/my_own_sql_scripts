--column username format a16
column account_status format a16

ttitle center '***** DBA_USERS_WITH_DEFPWD View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
prompt The following users are using the default password:

SELECT *
  FROM dba_users_with_defpwd
ORDER BY username;

clear columns
ttitle off

