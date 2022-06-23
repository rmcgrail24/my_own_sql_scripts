set linesize 156
set pagesize 66

ttitle center '***** USER_SEGMENTS View *****' - 
       right 'Page: ' format 99 sql.pno skip 2 
  
column segment_name format a30 
column partition_name format a30
column bytes format 999,999,999 

SELECT segment_name,
       segment_type,
       tablespace_name,
--       partition_name,
       extents,
       blocks,
       bytes
  FROM user_segments
ORDER BY segment_type, segment_name;

clear columns
ttitle off
