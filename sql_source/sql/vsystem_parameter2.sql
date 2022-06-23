column name format a35
column value format a50
column description format a30
column isdefault format a11 hea "Is Default?"
column isbasic format a9 hea "Basic"
column issys_modifiable format a10 hea "System|Modifiable"
column isses_modifiable format a10 hea "Session|Modifiable"
column isinstance_modifiable format a10 hea "Instance|Modifiable"

set pages 54
--set pause on

ttitle center '***** V$SYSTEM_PARAMETER2 View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT num,
       name,
       type,
       value,
       isdefault,
--       description,
--       isbasic,
       issys_modifiable,
       isses_modifiable
--       isinstance_modifiable
  FROM v$system_parameter2
-- WHERE LOWER(name) LIKE 'o7%'
-- WHERE LOWER(name) IN ('local_listener', 'instance_name', 'service_names')
--ORDER BY name 
--ORDER BY isdefault, isbasic, name
ORDER BY name
/
clear columns
ttitle off
--set pause off

