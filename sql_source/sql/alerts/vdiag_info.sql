column name format a40
column value format a100

ttitle center '***** V$DIAG_INFO View *****' -
       right 'Page: ' format 99 sql.pno skip 2

prompt 
prompt List of all the important ADR locations for the current Oracle Database instance.

SELECT *
  FROM v$diag_info;

clear columns
ttitle off

