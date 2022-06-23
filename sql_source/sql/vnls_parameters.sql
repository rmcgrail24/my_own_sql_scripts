set linesize 156
set pagesize 66

ttitle center '***** V$NLS_PARAMETERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$nls_parameters
ORDER BY parameter;

clear columns
ttitle off
