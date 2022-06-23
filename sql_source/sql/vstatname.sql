ttitle center '***** V$STATNAME View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$statname
ORDER BY name;

ttitle off

