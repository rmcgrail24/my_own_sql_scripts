set feedback off;
set hea off;
spool cold_backup.sh
SELECT 'cp ' || name || ' /home/oracle/tmp' FROM v$datafile
UNION ALL
SELECT 'cp ' || name || ' /home/oracle/tmp' FROM v$controlfile
UNION ALL
SELECT 'cp ' || member || ' /home/oracle/tmp' FROM v$logfile;

CREATE pfile='/home/oracle/tmp/spfile_backup.ora' FROM spfile;

spool off;
set feedback on;
set hea on;

