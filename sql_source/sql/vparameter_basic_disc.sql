column name format a40
column value format a80
column p_value format a40 hea 'V$PARAMETER Value'
column spp_value format a40 hea 'V$SPPARAMETER Value'
column description format a80
column isbasic format a9 hea "Is Basic?"

ttitle center '***** Discrepancies between V$PARAMETER and V$SPPARAMETER *****' skip 1 -
       center 'NOTE: V$PARAMETER Value is Displayed' -
       right 'Page: ' format 99 sql.pno skip 2

--SELECT name, TO_CHAR(type), value FROM v$parameter
--MINUS
--SELECT name, type, value FROM v$spparameter
--ORDER BY name;

--SELECT name, type, value FROM v$spparameter
--MINUS
--SELECT name, TO_CHAR(type), value FROM v$parameter
--ORDER BY name;

--SELECT name FROM v$parameter
--MINUS
--SELECT name FROM v$spparameter
--ORDER BY name;

--SELECT name, value FROM v$parameter
--MINUS
--SELECT name, value FROM v$spparameter
--ORDER BY name;

SELECT name, NVL(p.value, 'NULL') p_value, NVL(spp.value, 'NULL') spp_value
  FROM v$parameter p JOIN v$spparameter spp USING (name)
-- WHERE p.value != spp.value
 WHERE p.isbasic = 'TRUE'
ORDER BY name;

clear columns
ttitle off

