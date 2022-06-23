column file_name format a55 hea "Datafile"
column tablespace_name format a15
column online_status heading "Online|Status"
column megs format 999,999.99 hea 'Megabytes'
column blocks format 999,999,999,999

break on report
compute sum label Sum avg label Average of megs blocks on report

ttitle center "***** DBA_DATA_FILES View *****" skip 2

SELECT file_id,
       file_name,
       tablespace_name,
       bytes / (1024*1024) megs,
       blocks,
       status,
       online_status
  FROM dba_data_files
ORDER BY tablespace_name;

clear breaks
clear columns
clear computes

ttitle off

