set linesize 156;
set pagesize 66;

column owner format a25;
column object_name format a25;

ttitle center '***** Database Objects *****' -
       right 'Page: ' format 99 sql.pno skip -
       center 'DBA_OBJECTS View' skip 2
 
SELECT owner,
       object_name,
       object_type,
       object_id,
       created "Created",
       last_ddl_time "Last DDL Time",
       TO_DATE(timestamp, 'YYYY-MM-DD HH24:MI:SS') "Timestamp",
       status
  FROM dba_objects
-- WHERE object_type IN ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'PACKAGE BODY')
-- WHERE object_type LIKE 'DIRECTORY%'
 WHERE object_type = 'DIMENSION'
--   AND owner = 'PRACTICE'
ORDER BY object_name;

clear columns
ttitle off

