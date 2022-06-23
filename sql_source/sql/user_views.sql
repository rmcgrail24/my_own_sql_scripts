ttitle center '***** USER_VIEWS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT view_name,
       text_length,
       view_type,
       superview_name
  FROM user_views
ORDER BY view_name;

clear columns
ttitle off

