column cfrs hea "Control File|Record Stamp"

ttitle center "***** V$LOG Joined with V$LOG_HISTORY *****" skip 2

SELECT l.group#,
       thread#,
       sequence#,
       l.members,
       l.status "Group Status",
       lh.recid,
       lh.stamp cfrs,
       lh.next_change# "Highest SCN"
  FROM v$log l JOIN v$log_history lh USING (thread#, sequence#)
ORDER BY l.group#;

clear columns
ttitle off

