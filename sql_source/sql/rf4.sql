prompt This script will list all of the dependent table names and
prompt referential integrity, or foreign key, constraints
prompt referring to a given parent table.  This is a slightly
prompt different version from rf3.sql.
prompt
prompt The columns displayed are:
prompt 1) the name of the referential integrity constraint;;
prompt 2) the name of the detail, or child, table;;
prompt 3) the status of the referential integrity constraint.
prompt

column constraint_name format a40 heading 'Ref Integrity|Constraint Name'
column table_name format a30 heading 'Dependent|Table Name'
column status heading 'Status'

SELECT constraint_name,
       table_name,
       status
  FROM all_constraints
 WHERE r_constraint_name IN
    (SELECT constraint_name
       FROM all_constraints
      WHERE table_name = UPPER('&parent_table_name'));

clear columns

