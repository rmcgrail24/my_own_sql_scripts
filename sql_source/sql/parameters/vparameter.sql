column name format a35
column value format a50
column description format a30
column default_value format a30 hea "Default Value"
column isdefault format a11 hea "Is Default?"
column isbasic format a9 hea "Basic"
column issys_modifiable format a10 hea "System|Modifiable"
column isses_modifiable format a10 hea "Session|Modifiable"
column isinstance_modifiable format a10 hea "Instance|Modifiable"
column hash hea "Hash"
column con_id hea "Con ID"

set pages 54
--set pause on

ttitle center '***** V$PARAMETER View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT num,
       name,
       type,
       value,
       default_value,
       isdefault
--       description,
--       isbasic,
--       issys_modifiable,
--       isses_modifiable,
--       isinstance_modifiable
--       hash,
--       con_id
  FROM v$parameter
 WHERE name LIKE '%trace%'
    OR name LIKE '%dump%'
    OR name IN ('diagnostic_dest','max_dump_file_size','timed_statistics')
-- WHERE name IN ('local_listener', 'instance_name', 'service_names')
ORDER BY name 
--ORDER BY isdefault, isbasic, name
/
--clear columns
--ttitle off
--set pause off
