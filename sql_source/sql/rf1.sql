prompt This script will list all of the referential integrity,
prompt or foreign key, constraints for a table.
prompt 
prompt The columns displayed are:
prompt 1) the name of the constraint;;
prompt 2) the parent, or referenced, table;;
prompt 3) the column(s) in the parent table;;
prompt 4) the position of the column in the primary key of the parent table;;
prompt 5) the status of the constraint (ENABLED?);;
prompt 6) whether the constraint is checked as a statement is executed (IMMEDIATE) or when a transaction is commited (DEFERRED);;
prompt 7) whether all data obey the constraint.
prompt
column constraint_name format a40 heading 'Constraint|Name'
column table_name format a30 heading 'Parent|Table Name'
column column_name format a30 heading 'Parent Table|Column Name'
column position format 99 heading 'P|O|S'

break on constraint_name;

SELECT ac.constraint_name,
       acc.table_name,
       acc.column_name,
       acc.position,
       ac.status,
       ac.deferred,
       ac.validated
  FROM all_constraints ac JOIN all_cons_columns acc ON (ac.r_constraint_name = acc.constraint_name)
 WHERE ac.constraint_type = 'R'
   AND ac.table_name = UPPER('&table_name')
ORDER BY constraint_name, position;
 
clear breaks

