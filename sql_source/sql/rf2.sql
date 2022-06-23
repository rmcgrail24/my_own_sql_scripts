prompt This script will list all of the referential integrity,
prompt or foreign key, constraints for a table, and the name
prompt of the corresponding primary key in the parent table.
prompt Use this script when you know the name of the child
prompt table and want the name of the parent table.
prompt
prompt The columns displayed are:
prompt 1) the name of the detail, or child, table;;
prompt 2) the name of the referential integrity constraint;;
prompt 3) the status of the referential integrity constraint;;
prompt 4) the parent, or referenced, table;;
prompt 5) the name of the primary key in the parent table.
prompt

column dtn format a30 heading 'Detail|Table Name'
column rcn format a40 heading 'Ref. Integrity|Constraint Name'
column cn format a40 heading 'Constraint|Name'
column mtn format a30 heading 'Parent|Table Name'
column pkn format a15 heading 'Primary|Key Name'
column st format a1 heading 'S|t|a|t'

--SELECT ac1.table_name dtn,
SELECT ac1.constraint_name cn,
       ac1.r_constraint_name rcn,
       ac2.table_name mtn,
--       DECODE(ac1.status, 'ENABLED', 'E',
--                          'DISABLED', 'D') st,
       ac1.status,
       ac1.deferred,
       ac1.validated
--       ac2.constraint_name pkn
  FROM all_constraints ac1 JOIN all_constraints ac2 ON (ac1.r_constraint_name = ac2.constraint_name)
 WHERE ac1.constraint_type = 'R'
   AND ac2.constraint_type = 'P'
   AND ac1.table_name = UPPER('&child_table_name');
 
