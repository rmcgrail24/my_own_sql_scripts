column included_in_database_backup format a11 hea "Included in|Database|Backup"
column flashback_on format a12 hea "Flashback On"
column encrypt_in_backup format a7 hea "Encrypt|in|Backup"

SELECT instance_number,
       instance_name,
       version,
       startup_time,
       status,
       database_status,
       instance_role,
       active_state,
       logins
  FROM v$instance;

