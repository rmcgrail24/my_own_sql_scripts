set linesize 156
set pagesize 66

column table_name format a30
column last_analyzed hea 'Last|Analyzed'

ttitle center '***** ALL_TABLES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT owner,
       table_name,
       tablespace_name,
       status,
       num_rows,
       avg_row_len,
       blocks,
       last_analyzed
  FROM all_tables
ORDER BY table_name;

clear columns
ttitle off
