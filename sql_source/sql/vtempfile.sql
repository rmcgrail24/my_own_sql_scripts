column file_name format a50 heading "Tempfile"
column tablespace_name format a20 heading "Tablespace"
column bytes format 999,999,999,999
column blocks format 999,999,999,999
column block_size format 999,999,999,999

SELECT t.file#,
       t.name file_name,
       ts.name tablespace_name,
       ts#,
       t.bytes,
       t.blocks,
       t.block_size,
       t.status
  FROM v$tempfile t JOIN v$tablespace ts USING (ts#)
ORDER BY t.file#;

clear columns

