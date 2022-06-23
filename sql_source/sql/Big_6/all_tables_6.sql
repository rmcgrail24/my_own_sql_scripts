-- This query returns a list of tables in schemas sorted by name,
-- with comments and number of rows in each table.

select tab.owner as schema_name,
       tab.table_name as table_name,
       obj.created,
       obj.last_ddl_time as last_modified,       
       tab.num_rows,
       tab.last_analyzed,
       comm.comments
  from all_tables tab
       inner join all_objects obj
           on obj.owner = tab.owner
          and obj.object_name = tab.table_name
       left outer join all_tab_comments comm
           on tab.table_name = comm.table_name
          and tab.owner = comm.owner
 where tab.owner not in ('ANONYMOUS',
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
 order by tab.owner, tab.table_name;
