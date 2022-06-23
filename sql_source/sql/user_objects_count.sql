set linesize 156;
set pagesize 66;

ttitle center '***** User Objects and Their Counts *****' -
       right 'Page: ' format 99 sql.pno skip 2

column count format 999,999

break on report
compute sum label Total of count on report

SELECT object_type,
       COUNT(object_type) "Count"
  FROM user_objects
GROUP BY object_type
ORDER BY object_type;

clear breaks
clear computes
ttitle off

