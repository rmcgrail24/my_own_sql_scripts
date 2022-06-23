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
       (SELECT SUM(bytes) allocated, COUNT(file_id) cnt
          FROM dba_data_files
         WHERE tablespace_name = UPPER('&&tablespace_name')) d,
       (SELECT SUM(bytes) free
          FROM dba_free_space
         WHERE tablespace_name = UPPER('&tablespace_name')) f,
       (SELECT SUM(bytes) used
          FROM dba_segments
         WHERE tablespace_name = UPPER('&tablespace_name')) u
 WHERE t.tablespace_name = UPPER('&tablespace_name');

undefine tablespace_name

