set linesize 156
set pagesize 66

column owner format a15
column object_name format a25

ttitle center '***** Database Objects *****' -
       right 'Page: ' format 99 sql.pno skip -
       center 'ALL_OBJECTS View' skip 2
 
SELECT owner,
       object_name,
       object_type,
       object_id,
       TO_CHAR(created, 'YYYY-MM-DD HH24:MI:SS') "Created",
       TO_CHAR(last_ddl_time, 'YYYY-MM-DD HH24:MI:SS') "Last DDL Time",
--       TO_DATE(timestamp, 'YYYY-MM-DD HH24:MI:SS') "Timestamp",
       timestamp "Timestamp",
       status
  FROM all_objects
-- WHERE object_type LIKE 'PACKAGE%'
 WHERE object_type IN ('PACKAGE'
	              ,'PACKAGE BODY'
--                      ,'FUNCTION'
--                      ,'PROCEDURE'
	              )
--   AND owner = 'PRACTICE'
   AND object_name like 'C%'
ORDER BY object_name;

clear columns
ttitle off
