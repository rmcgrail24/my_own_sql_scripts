ttitle center '***** SESSION_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT *
  FROM session_privs
ORDER BY privilege;

ttitle off

