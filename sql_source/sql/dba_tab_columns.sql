column data_type format a20
column nullable format a20 hea "Nullable?"

ttitle center '***** DBA_TAB_COLUMNS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT owner,
       column_name,
--       column_id,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable,
       avg_col_len,
       num_distinct
  FROM dba_tab_columns
 WHERE table_name = UPPER('&table_name')
ORDER BY table_name;

clear columns
ttitle off

