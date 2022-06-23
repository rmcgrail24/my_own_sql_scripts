ttitle center '***** ALL_DIRECTORIES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
column directory_path format a80

SELECT *
  FROM all_directories;

clear columns
ttitle off

