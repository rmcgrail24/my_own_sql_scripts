set linesize 156
set pagesize 66

column owner format a25
column object_name format a25

ttitle center '***** Database Objects *****' -
       right 'Page: ' format 99 sql.pno skip -
       center 'USER_OBJECTS View' skip 2
 
SELECT object_name,
       object_type,
       object_id,
       TO_CHAR(created, 'YYYY-MM-DD HH24:MI:SS') "Created",
       TO_CHAR(last_ddl_time, 'YYYY-MM-DD HH24:MI:SS') "Last DDL Time",
--       TO_DATE(timestamp, 'YYYY-MM-DD HH24:MI:SS') "Timestamp",
       timestamp "Timestamp",
       status
  FROM user_objects
-- WHERE object_type IN ('PACKAGE', 'PACKAGE BODY')
 WHERE object_type IN ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'PACKAGE BODY', 'SEQUENCE')
-- WHERE object_type LIKE 'DIRECTORY%'
-- WHERE object_type = 'DIMENSION'
--   AND owner = 'PRACTICE'
ORDER BY object_type, object_name;

clear columns
ttitle off
