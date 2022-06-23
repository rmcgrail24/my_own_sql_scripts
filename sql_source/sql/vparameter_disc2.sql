column name format a50
column value format a80 hea 'V$SPPARAMETER Value'

prompt
prompt Enter the name of a parameter in the view V$SPPARAMETER
prompt which has a value different from the value in the view V$PSARAMETER:
prompt

SELECT name,
       value
  FROM v$spparameter
 WHERE name = '&name';

clear columns

