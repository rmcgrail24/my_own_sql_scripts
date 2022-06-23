repheader page center 'USER CATALOG'
ttitle center '***** USER_CATALOG View *****' -
       right 'Page: ' format 999 sql.pno skip 2

SELECT *
  FROM user_catalog
ORDER By table_name;

ttitle off
repheader off

