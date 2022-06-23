ttitle center '***** USER_DIMENSIONS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT dimension_name,
       owner,
       invalid,
       compile_state,
       revision
  FROM user_dimensions
ORDER BY dimension_name;

clear columns
ttitle off

