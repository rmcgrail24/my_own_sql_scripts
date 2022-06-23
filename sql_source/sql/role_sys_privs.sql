ttitle center '***** ROLE_SYS_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM role_sys_privs
ORDER BY role;

ttitle off

