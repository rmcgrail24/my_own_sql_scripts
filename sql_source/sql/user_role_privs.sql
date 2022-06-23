ttitle center '***** USER_ROLE_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM user_role_privs;

ttitle off

