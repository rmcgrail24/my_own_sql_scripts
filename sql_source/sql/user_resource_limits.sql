ttitle center '***** USER_RESOURCE_LIMITS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM user_resource_limits
ORDER BY resource_name;

clear columns
ttitle off

