rem Displays all dynamic performance tables, views, and derived tables in the database.

SELECT *
  FROM v$fixed_table
ORDER BY name;

