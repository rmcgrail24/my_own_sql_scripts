ttitle center '***** V$ARCHIVE_PROCESSES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$archive_processes;

clear columns
ttitle off

