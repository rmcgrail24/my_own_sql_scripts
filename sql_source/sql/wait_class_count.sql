ttitle center '***** Wait Class Count *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT wait_class,
       COUNT(wait_class)
  FROM v$event_name
GROUP BY wait_class
ORDER BY wait_class;

ttitle off

