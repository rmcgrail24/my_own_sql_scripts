column service_name format a40
column stat_name format a40

SELECT aggregation_type,
       service_name,
       module,
       action,
       stat_id,
       stat_name,
       value
  FROM v$serv_mod_act_stats;

clear columns

