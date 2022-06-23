column file_name format a50 hea "Datafile"
column online_status heading "Online|Status"
column bytes format 999,999,999,999
column blocks format 999,999,999,999
column autoextensible format a15 hea "Autoextensible?"

ttitle center '***** DBA_TEMP_FILES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT file_id,
       file_name,
       tablespace_name,
       bytes,
       blocks,
       status,
       autoextensible
  FROM dba_temp_files
ORDER BY file_id;

clear columns
ttitle off

