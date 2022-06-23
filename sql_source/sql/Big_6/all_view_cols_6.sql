-- This query returns a list of views with their columns.

select col.table_name as view_name,
       col.column_name,
       col.data_type,
       decode(char_length, 
              0, data_type,
              data_type || '(' || char_length || ')') as data_type_ext,
       col.data_length,
       col.data_precision,
       col.data_scale,
       col.nullable,
       nvl(comm.comments,' ') as comments
  from all_views v 
       inner join all_tab_columns col
           on v.view_name = col.table_name
       inner join all_col_comments comm
           on col.table_name = comm.table_name 
          and col.owner = comm.owner
          and col.column_name = comm.column_name 
 where col.owner not in ('ANONYMOUS',
                         'APEX_040000',
                         'APEX_PUBLIC_USER',
                         'CTXSYS',
                         'DBSNMP',
                         'DIP',
                         'EXFSYS',
                         'FLOWS_30000',
                         'FLOWS_FILES',
                         'LBACSYS',
                         'MDDATA',
                         'MDSYS',
                         'MGMT_VIEW',
                         'OLAPSYS',
                         'ORACLE_OCM',
                         'ORDPLUGINS',
                         'ORDSYS',
                         'OUTLN',
                         'OWBSYS',
                         'PUBLIC',
                         'SI_INFORMTN_SCHEMA',
                         'SPATIAL_CSW_ADMIN_USR',
                         'SPATIAL_WFS_ADMIN_USR',
                         'SYS',
                         'SYSMAN',
                         'SYSTEM',
                         'TSMSYS',
                         'WK_TEST',
                         'WKSYS',
                         'WKPROXY',
                         'WMSYS',
                         'XDB',
                         'XS$NULL')
--   and col.owner = 'HR'   
 order by col.table_name, col.column_name;
