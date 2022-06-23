column owner format a20
column table_name format a20
column index_name format a20
column column_name format a20
column low_value format a40
column high_value format a40
column last_analyzed hea "Last Analyzed"

break on owner on table_name

ttitle center '***** DBA_IND_STATISTICS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT owner,
       index_name,
       blevel,
       leaf_blocks,
       distinct_keys,
       avg_leaf_blocks_per_key "LEAFBLK_PER_KEY",
       avg_data_blocks_per_key "DATABLK_PER_KEY",
       num_rows,
       TO_CHAR(last_analyzed, 'dd-Mon-yyyy hh:mi:ss') last_analyzed
  FROM dba_ind_statistics
 WHERE table_name = UPPER('&table_name')
ORDER BY table_name;

clear breaks
clear columns
ttitle off

