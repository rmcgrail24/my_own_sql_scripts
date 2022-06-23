set linesize 156
set pagesize 66

column table_name format a30
column last_analyzed hea 'Last|Analyzed'

ttitle center '***** USER_TABLES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT table_name,
       tablespace_name,
       partitioned,
       status,
       num_rows,
       avg_row_len,
       blocks,
--       empty_blocks,
       avg_space,
       chain_cnt,
       last_analyzed
  FROM user_tables
ORDER BY table_name;

clear columns
ttitle off
