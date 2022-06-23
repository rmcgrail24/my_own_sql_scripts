ttitle center '***** USER_SYS_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM user_sys_privs
ORDER BY username;

ttitle off

