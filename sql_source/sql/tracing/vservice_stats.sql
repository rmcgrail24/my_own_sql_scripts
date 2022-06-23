column service_name format a40
column stat_name format a40

SELECT service_name_hash,
       service_name,
       stat_id,
       stat_name,
       value
  FROM v$service_stats;

clear columns

