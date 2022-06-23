prompt This script will list all of the dependent table names and
prompt referential integrity, or foreign key, constraints
prompt referring to a given parent table.  Use this script when
prompt you know the name of the parent table and want the name(s)
prompt of the child (children) table(s).
prompt
prompt The columns displayed are:
prompt 1) the name of the detail, or child, table;;
prompt 2) the name of the referential integrity constraint;;
prompt 3) the status of the referential integrity constraint;;
prompt 4) the name of the parent table;;
prompt 5) the name of the primary key of the parent table.
prompt

column dtn format a30 heading 'Detail|Table Name'
column ri format a40 heading 'Ref Integrity|Constraint Name'
column st format a1 heading 'S|t|a|t'
column mtn format a30 heading 'Parent|Table Name'
column pkn format a15 heading 'Parent|Primary Key'

SELECT ac2.table_name dtn,
       ac2.constraint_name ri,
       DECODE(ac2.status, 'ENABLED', 'E', 'DISABLED', 'D') st,
       ac1.table_name mtn,
       ac1.constraint_name pkn
  FROM all_constraints ac1 JOIN ALL constraints ac2 ON (ac1.constraint_name = ac2.r_constraint_name)
 WHERE ac1.constraint_type = 'P'
   AND ac2.constraint_type = 'R'
   AND ac1.table_name = UPPER('&parent_table_name');

clear columns

