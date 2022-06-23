-- This query returns a list of database views
-- with their definition SQL and comments.

select obj.owner as schema_name,
       obj.object_name as view_name,
       obj.created,
       obj.last_ddl_time as last_modified,
       def.text as definition,
       comm.comments
  from all_objects obj
       left outer join all_views def
           on obj.owner = def.owner
          and obj.object_name = def.view_name
       left outer join all_tab_comments comm
           on obj.object_name = comm.table_name
          and obj.owner = comm.owner
 where obj.object_type = 'VIEW'
   and obj.owner not in ('ANONYMOUS',
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
 order by obj.owner, obj.object_name;
