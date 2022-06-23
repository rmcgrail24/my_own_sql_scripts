column stat_name format a50
column cumulative format a4 hea Cuml

ttitle center '***** V$OSSTAT View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$osstat
ORDER BY stat_name;

clear columns
ttitle off

