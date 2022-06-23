ttitle center '***** V$TIMEZONE_NAMES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$timezone_names
ORDER BY tzname;

ttitle off

