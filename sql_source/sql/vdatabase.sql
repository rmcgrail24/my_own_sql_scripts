column platform_name format a30

ttitle center "***** V$DATABASE View *****" skip 2

SELECT dbid,
       name,
       created,
       log_mode,
       database_role,
       platform_id,
       platform_name,
       current_scn,
--       db_unique_name,
       flashback_on
--       fs_failover_status
  FROM v$database;

clear columns
ttitle off

