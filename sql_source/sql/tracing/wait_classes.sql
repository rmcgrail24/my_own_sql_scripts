ttitle center '***** Wait Class *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT wait_class,
       name
  FROM v$event_name
ORDER BY wait_class, name;

ttitle off
