ttitle center '***** DBA_FREE_SPACE View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM dba_free_space;

clear breaks
clear columns
ttitle off

