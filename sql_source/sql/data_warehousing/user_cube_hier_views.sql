ttitle center '***** USER_CUBE_HIER_VIEWS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT dimension_name,
       hierarchy_name,
       view_name
  FROM user_cube_hier_views
ORDER BY dimension_name;

clear columns
ttitle off

