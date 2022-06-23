ttitle center '***** DBA_EXTENTS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
column owner format a16
column segment_name format a30
column bytes format 999,999,999

break on segment_name;
--break on segment_type;
--break on owner;
--break on tablespace_name;

SELECT segment_name,
--       partition_name,
       segment_type,
       owner,
       tablespace_name,
       extent_id,
       file_id,
       block_id,
--       relative_fno
       blocks,
       bytes
  FROM dba_extents
 WHERE LOWER(segment_name) = LOWER('&segment_name');

clear breaks
clear columns
ttitle off

