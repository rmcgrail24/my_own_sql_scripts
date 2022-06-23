ttitle center '***** DBA_CUBE_VIEW_COLUMNS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT owner,
       cube_name,
       view_name,
       column_name,
       column_type
  FROM dba_cube_view_columns
ORDER BY cube_name;

clear columns
ttitle off

