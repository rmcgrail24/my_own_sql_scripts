SELECT t.tablespace_name name,
       d.allocated,
       u.used,
       f.free,
       t.status,
       d.cnt,
       contents,
       t.extent_management extman,
       t.segment_space_management segman
  FROM dba_tablespaces t,
(SELECT SUM(bytes) allocated,
        COUNT(file_id) cnt
   FROM dba_data_files
  WHERE tablespace_name='EXAMPLE') d,
(SELECT SUM(bytes) free
   FROM dba_free_space
  WHERE tablespace_name='EXAMPLE') f,
(SELECT SUM(bytes) used
   FROM dba_segments
  WHERE tablespace_name='EXAMPLE') u
 WHERE t.tablespace_name='EXAMPLE';

