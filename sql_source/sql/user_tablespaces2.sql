set linesize 156

column file_name format a55 heading "Datafile"
column tablespace_name format a15 heading "Tablespace"
column t_status format a10 heading "Tablespace|Status"
column d_status heading "Datafile|Status"
column bytes format 999,999,999,999
column blocks format 999,999,999,999
column block_size format 999,999,999,999
column extent_management hea "Extent|Management"
column segment_space_management format a7 heading 'Segmnt|Space|Mngment'

break on report
compute sum label Total of bytes blocks on report

ttitle center '***** USER_TABLESPACES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT tablespace_name,
       file_name,
       bytes,
       blocks,
       t.status t_status,
       d.status d_status,
       segment_space_management,
       extent_management
  FROM user_tablespaces t JOIN user_data_files d USING (tablespace_name)
ORDER BY tablespace_name;

clear breaks
clear columns
clear computes
ttitle off

