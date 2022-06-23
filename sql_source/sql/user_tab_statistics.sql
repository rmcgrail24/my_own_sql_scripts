column table_name format a20
column partition_name format a20
column last_analyzed hea "Last Analyzed"

ttitle center '***** USER_TAB_STATISTICS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT table_name,
       partition_name,
       object_type,
       num_rows,
       avg_row_len,
       blocks,
       TO_CHAR(last_analyzed, 'dd-Mon-yyyy hh:mi:ss') last_analyzed
  FROM user_tab_statistics
 WHERE table_name = UPPER('&table_name')
ORDER BY table_name;

clear columns
ttitle off

