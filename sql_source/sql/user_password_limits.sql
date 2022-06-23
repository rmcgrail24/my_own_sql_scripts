ttitle center '***** USER_PASSWORD_LIMITS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM user_password_limits
ORDER BY resource_name;

clear columns
ttitle off

