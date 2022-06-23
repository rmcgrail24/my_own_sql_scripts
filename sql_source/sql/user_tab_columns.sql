column data_type format a20

ttitle center '***** USER_TAB_COLUMNS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT column_name,
       column_id,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable,
       avg_col_len
  FROM user_tab_columns
 WHERE table_name = UPPER('&table_name')
ORDER BY column_name;

clear columns
ttitle off

