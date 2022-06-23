column included_in_database_backup format a11 hea "Included in|Database|Backup"
column flashback_on format a12 hea "Flashback On"
column encrypt_in_backup format a7 hea "Encrypt|in|Backup"

ttitle center "***** V$TABLESPACE View *****" skip 2

SELECT *
  FROM v$tablespace
ORDER BY ts#;

clear columns
ttitle off

