column file_name format a55 heading "Datafile"
column tablespace_name format a15 heading "Tablespace"
column megs format 999,999.99 hea "Megabytes"
column blocks format 999,999,999,999
column block_size format 999,999,999,999

break on report
compute sum label Total of megs blocks on report

ttitle center "***** V$DATAFILE Joined with V$TABLESPACE *****" skip 2 -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT t.name tablespace_name,
       ts#,
       d.name file_name,
       d.file#,
       d.bytes / (1024*1024) megs,
       d.blocks,
       d.block_size,
       d.status
  FROM v$datafile d JOIN v$tablespace t USING (ts#)
ORDER BY t.name;

clear columns
clear computes
ttitle off

