column name format a35
column value format a30
column description format a30
column isdefault format a9 hea "Default"
column isbasic format a9 hea "Basic"
column issys_modifiable format a10 hea "System|Modifiable"
column isses_modifiable format a10 hea "Session|Modifiable"
column isinstance_modifiable format a10 hea "Instance|Modifiable"

ttitle center '***** Non-Default Initialization Parameters *****' -
       right 'Page: ' format 99 sql.pno skip 1 -
       center '(V$PARAMETER.ISDEFAULT = FALSE)' skip 2
 
SELECT num,
       name,
       type,
       value,
--       description,
       isbasic,
       issys_modifiable,
       isses_modifiable,
       isinstance_modifiable
  FROM v$parameter
 WHERE isdefault = 'FALSE'
--ORDER BY name 
--ORDER BY isdefault, isbasic, name
ORDER BY isbasic, name
/
clear columns
ttitle off

