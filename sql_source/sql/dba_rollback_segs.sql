column owner format a15
column segment_name format a30

SELECT owner,
       segment_name,
       segment_id,
       tablespace_name,
       file_id,
       block_id,
       max_extents,
       status
  FROM dba_rollback_segs
ORDER BY segment_id;

--clear columns

