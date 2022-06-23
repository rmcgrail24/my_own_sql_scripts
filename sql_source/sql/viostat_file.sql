column small_read_megabytes format 9,999,999
column small_write_megabytes format 9,999,999
column small_read_servicetime format 9,999,999

ttitle center '***** V$IOSTAT_FILE View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM V$iostat_file;

ttitle off

