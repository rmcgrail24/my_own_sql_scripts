ttitle center '***** ROLE_ROLE_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM role_role_privs
ORDER BY role;

ttitle off

