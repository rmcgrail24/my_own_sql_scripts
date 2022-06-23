column kilobytes_read format 9,999,999

ttitle center '***** V$IOSTAT_NETWORK View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM V$iostat_network;

ttitle off

