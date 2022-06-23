prompt This script will list several attributes of a specified constraint.
prompt The columns displayed are:
prompt 1) the name of the constraint;;
prompt 2) the status of the constraint;;
prompt 3) the column(s) that comprise(s) the constraint;;
prompt 4) the position of the column in the primary key of the parent table;;
prompt
prompt The user will enter the type and name of the constraint.
prompt
column constraint_name format a30 heading 'Constraint Name'
column column_name format a25 heading 'Column Name'

SELECT c.constraint_name,
       status,
       column_name,
       position
  FROM all_constraints c,
       all_cons_columns  cc
 WHERE c.constraint_name = cc.constraint_name
   AND constraint_type = UPPER('&type')
   AND c.table_name = UPPER('&table_name')
 ORDER BY c.constraint_name,
          position;

clear columns

