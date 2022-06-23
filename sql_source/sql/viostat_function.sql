column small_read_megabytes format 9,999,999
column small_write_megabytes format 9,999,999
column wait_time format 9,999,999

ttitle center '***** V$IOSTAT_FUNCTION View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM V$iostat_function;

clear columns
ttitle off

