set linesize 156
set pagesize 66

ttitle center '***** DBA_SEGMENTS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
column owner format a15
column segment_name format a30
column partition_name format a30
column bytes format 999,999,999

SELECT segment_name,
       segment_type,
       owner,
       tablespace_name,
       header_file,
       extents,
       blocks,
       bytes
  FROM dba_segments
ORDER BY segment_name;

clear columns
ttitle off
