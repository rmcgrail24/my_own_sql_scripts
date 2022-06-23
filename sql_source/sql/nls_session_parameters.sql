set linesize 156
set pagesize 66

column parameter format a40
column value format a40

ttitle center '***** NLS_SESSION_PARAMETERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
SELECT *
  FROM nls_session_parameters
ORDER BY parameter;

clear columns
ttitle off

