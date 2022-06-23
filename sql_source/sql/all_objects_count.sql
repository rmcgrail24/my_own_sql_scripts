set linesize 156;
set pagesize 66;

ttitle center '***** All Objects and Their Counts *****' -
       right 'Page: ' format 99 sql.pno skip 1 -
       center 'ALL_OBJECTS View' skip 2

column count format 999,999

break on report
compute sum label Total of count on report

SELECT object_type,
       COUNT(object_type) "Count"
  FROM all_objects
GROUP BY object_type
ORDER BY object_type;

clear breaks
clear columns
clear computes
ttitle off

