column segment_name format a30
column bytes format 999,999,999

break on segment_name;
--break on segment_type;
--break on owner;
--break on tablespace_name

SELECT segment_name,
       partition_name,
       segment_type,
       tablespace_name,
       extent_id,
       bytes,
       blocks
  FROM user_extents
 WHERE LOWER(segment_name) = LOWER('&segment_name');

clear breaks
clear columns

