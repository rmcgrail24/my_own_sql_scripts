ttitle center '***** ALL_USERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT username,
       user_id,
       created,
       status
  FROM all_users
ORDER BY username;

ttitle off
