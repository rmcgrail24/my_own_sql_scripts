ttitle center '***** SESSION_ROLES View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM session_roles
ORDER BY role;

ttitle off

