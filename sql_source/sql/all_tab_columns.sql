column data_type format a20
column nullable format a20 hea "Nullable?"

ttitle center '***** ALL_TAB_COLUMNS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT owner,
       table_name,
       column_name,
       column_id,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable,
       avg_col_len
  FROM all_tab_columns
-- WHERE column_name LIKE '%ASSOC%'
 WHERE column_name LIKE '%CUST%'
-- WHERE table_name = UPPER('&table_name')
   AND table_name = 'NPPUSER'
--   AND owner = 'NPP'
--   AND owner NOT IN ('SYS', 'SYSTEM', 'APEX_040100')
ORDER BY column_name;

clear columns
ttitle off

