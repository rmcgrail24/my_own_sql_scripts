column controlfile format a75 hea 'Controlfile Names'
column name format a75 hea 'Datafile and Tempfile Names'
column member format a75 hea 'Names of Online Redo Log File Members'
column bytes format 999,999,999
prompt
prompt Determine the names and sizes of the controlfiles:

SELECT name controlfile,
       block_size * file_size_blks bytes
  FROM  v$controlfile;

prompt
prompt Determine the names and sizes of the online redo log file members:

SELECT member,
       bytes
  FROM v$log JOIN v$logfile USING (group#);

prompt
prompt Determine the names and sizes of the datafiles and the tempfiles:

SELECT name,
       bytes
  FROM v$datafile
UNION ALL
SELECT name,
       bytes
  FROM v$tempfile;

clear columns

