column total_bytes format 999,999,999,999 hea 'Byte sum of all user tables'

ttitle center '***** Disk Usage for All User Tables *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT SUM(bytes) total_bytes
  FROM user_segments
 WHERE segment_type = 'TABLE';

clear columns
ttitle off

