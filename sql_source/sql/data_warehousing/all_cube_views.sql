ttitle center '***** ALL_CUBE_VIEWS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT owner,
       cube_name,
       view_name
  FROM all_cube_views
ORDER BY cube_name;

clear columns
ttitle off

