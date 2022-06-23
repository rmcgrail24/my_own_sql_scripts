column megs format 9,999.99 hea "Megabytes"
column member format a50 heading "Member"
column status hea "Member|Status"
column first_change# format 999999999999999
column next_change# format 999999999999999
column is_recovery_dest_file format a10 hea "Is|Recovery|Dest File?"

break on group# skip 1

ttitle center "***** V$LOG Joined with V$LOGFILE *****" skip 2

SELECT group#,
--       l.thread#,
       l.sequence#,
       l.bytes / (1024*1024) megs,
--       l.blocksize,
       l.status "Group Status",
       l.first_change#,
       TO_CHAR(l.first_time, 'DD-MON-YYYY HH:MI:SS') "First SCN Time",
--       l.next_change#,
--       TO_CHAR(l.next_time, 'DD-MON-YYYY HH:MI:SS') "Next SCN Time",
--       lf.type,
       lf.member member,
       lf.status,
       l.archived
--       lf.is_recovery_dest_file
  FROM v$log l JOIN v$logfile lf USING (group#)
ORDER BY group#;

clear breaks
clear columns
ttitle off

