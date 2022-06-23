set linesize 156
set pagesize 66

column index_name format a30 hea 'Index|Name'
column column_name format a30 hea 'Column|Name'
column column_position hea 'Column|Position'
column num_rows format 999,999,999 hea 'Number|of Rows'
column distinct_keys format 999,999,999 hea 'Distinct Keys'

ttitle center '***** DBA_INDEXES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT index_name,
       column_name,
       column_position,
       index_type,
       uniqueness,
       status,
       distinct_keys,
       num_rows
  FROM dba_indexes NATURAL JOIN dba_ind_columns
 WHERE table_name = UPPER('&table_name')
   AND index_owner = UPPER('&index_owner')
ORDER BY index_name, column_position;

clear columns
ttitle off
