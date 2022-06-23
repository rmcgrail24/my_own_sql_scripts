column bytes format 999,999.99 hea 'Megabytes'
column resizeable format a11 hea 'Resizeable?'

SELECT name,
       bytes / (1024*1024) "bytes",
       resizeable
  FROM v$sgainfo
ORDER BY name;

clear columns

