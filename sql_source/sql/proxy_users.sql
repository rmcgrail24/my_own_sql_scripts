ttitle center '***** PROXY_USERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM proxy_users
ORDER BY client;

clear columns
ttitle off

