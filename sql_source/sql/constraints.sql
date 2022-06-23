column column_name format a40

SELECT column_name,
       position,
       constraint_name,
       constraint_type,
       status
  FROM user_cons_columns NATURAL JOIN user_constraints
 WHERE table_name = UPPER('&table_name')
ORDER BY constraint_name, position;

clear columns

