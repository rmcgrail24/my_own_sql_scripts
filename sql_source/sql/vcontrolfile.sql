set linesize 156
set pagesize 66

column name format a80
column block_size format 9,999,999
column file_size_blks format 999,999 hea "Control file    |size (in blocks)"
column is_recovery_dest_file format a11 hea "Is Recovery|Dest File?"

ttitle center "***** V$CONTROLFILE View *****" skip 2

SELECT name,
       status,
       block_size,
       file_size_blks,
       is_recovery_dest_file
  FROM v$controlfile;

clear columns
ttitle off
