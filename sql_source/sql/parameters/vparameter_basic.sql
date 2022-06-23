column name format a35
column value format a40
column description format a30
column isdefault format a9 hea "Default"
column isbasic format a9 hea "Basic"
column issys_modifiable format a10 hea "System|Modifiable"
column isses_modifiable format a10 hea "Session|Modifiable"
column isinstance_modifiable format a10 hea "Instance|Modifiable"

ttitle center '***** Basic Initialization Parameters *****' -
       right 'Page: ' format 99 sql.pno skip 1 -
       center '(V$PARAMETER.ISBASIC = TRUE)' skip 2
 
SELECT num,
       name,
       type,
       value,
--       description,
       isdefault,
       issys_modifiable,
       isses_modifiable,
       isinstance_modifiable
  FROM v$parameter
 WHERE isbasic = 'TRUE'
--ORDER BY name
--ORDER BY isdefault, isbasic, name
ORDER BY isdefault, name
/
clear breaks
clear columns
ttitle off

