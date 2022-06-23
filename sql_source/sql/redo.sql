column member format a50
column irdf format a11 hea 'Is Recovery|Dest. File?'

SELECT group#,
       l.thread#,
       l.sequence#,
       l.members,
       l.archived,
       l.status,
       lf.status,
       lf.type,
       lf.member,
       lf.is_recovery_dest_file irdf
  FROM v$log l JOIN v$logfile lf USING (group#)
ORDER BY group#;

clear columns

