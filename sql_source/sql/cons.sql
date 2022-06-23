prompt This script will list several attributes of a specified constraint.
prompt The columns displayed are:
prompt 1) the name of the constraint;;
prompt 2) the status of the constraint;;
prompt 3) the column(s) that comprise(s) the constraint;;
prompt 4) the position of the column in the primary key of the parent table;;
prompt 5) indicates whether the constraint is deferrable;;
prompt 6) indicates whether the constraint was initially deferred;;
prompt 7) enabled or disabled;;
prompt 8) validated or not (depends on status);;
prompt 9) when the constraint was last enabled or disabled;;
prompt 10) indicates whether the constraint is invalid.
prompt
prompt The user will enter the type and name of the constraint.
prompt

column constraint_name format a30 heading 'Constraint Name'
column column_name format a25 heading 'Column Name'
column deferrable format a14 heading 'Deferrable?'
column deferred format a10 heading 'Deferred?'
column status format a8 heading 'Status?'
column validated format a13 heading 'Validated?'
column last_change format a17 heading 'Last Change'
column invalid format a8 heading 'Invalid?'

SELECT c.constraint_name,
       status,
       column_name,
       position,
       deferrable,
       deferred,
       status,
       validated,
       last_change,
       invalid
  FROM all_constraints c JOIN all_cons_columns cc ON (c.constraint_name = cc.constraint_name)
 WHERE constraint_type = UPPER('&type')
   AND c.table_name = UPPER('&table_name')
 ORDER BY c.constraint_name,
          position;

clear columns

