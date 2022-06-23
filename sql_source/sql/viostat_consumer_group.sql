ttitle center '***** V$IOSTAT_CONSUMER_GROUP View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM v$iostat_consumer_group;

ttitle off

