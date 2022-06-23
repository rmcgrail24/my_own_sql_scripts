-- This query returns a list of tables and their constraints.

select foreign_table.owner as table_schema_name,
       foreign_table.table_name, 
       foreign_table.column_name,
       constr.constraint_name,
       primary_table.owner as primary_table_schema_name,
       primary_table.table_name as primary_table_name,  
       primary_table.column_name  as primary_table_column,
       foreign_table.table_name || '.' || 
         foreign_table.column_name || ' = ' || 
         primary_table.table_name  || '.' || 
         primary_table.column_name as join_condition
  from all_constraints constr 
       inner join all_cons_columns foreign_table
           on foreign_table.owner = constr.owner
          and foreign_table.constraint_name = constr.constraint_name
       inner join all_cons_columns primary_table 
           on primary_table.constraint_name = constr.r_constraint_name
          and primary_table.owner = constr.r_owner
          and primary_table.position = foreign_table.position
 where constr.r_owner not in ('ANONYMOUS',
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
   -- and constr.r_owner = 'HR'
   and lower(foreign_table.table_name) like '%'   
 order by foreign_table.table_name, foreign_table.column_name;
