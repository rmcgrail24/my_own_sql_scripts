ttitle center '***** Wait Events *****' -
       right 'Page: ' format 99 sql.pno skip 2

BREAK ON wait_class SKIP 1

SELECT wait_class,
       event_name
  FROM dba_hist_event_name
 ORDER BY wait_class, event_name;

ttitle off
