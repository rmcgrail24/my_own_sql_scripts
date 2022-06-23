column table_name format a20
column column_name format a20
column low_value format a40
column high_value format a40
column last_analyzed hea "Last Analyzed"

break on owner on table_name

ttitle center '***** ALL_TAB_COL_STATISTICS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT table_name,
       column_name,
       num_distinct,
--       low_value,
--       high_value,
       num_nulls,
       histogram,
       TO_CHAR(last_analyzed, 'dd-Mon-yyyy hh:mi:ss') last_analyzed
  FROM user_tab_col_statistics
 WHERE table_name = UPPER('&table_name')
ORDER BY table_name;

clear breaks
clear columns
ttitle off

