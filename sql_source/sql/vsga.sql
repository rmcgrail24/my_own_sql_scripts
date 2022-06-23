column value format 999,999.99 hea 'Value (Megabytes)'

SELECT name,
       value / (1024*1024) "value"
   FROM v$sga;

clear columns

