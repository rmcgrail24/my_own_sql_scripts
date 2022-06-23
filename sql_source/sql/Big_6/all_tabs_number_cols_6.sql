-- This query returns a list of tables
-- sorted by the number of columns they contain.

select col.owner as schema_name,
       col.table_name, 
       count(*) columns
  from all_tab_columns col 
       inner join all_tables tab
           on col.owner = tab.owner
          and col.table_name = tab.table_name
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
 group by col.owner,
          col.table_name
 order by count(*) desc;
