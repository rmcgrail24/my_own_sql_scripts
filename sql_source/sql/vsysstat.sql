ttitle center '***** V$SYSSTAT View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT statistic#,
       name,
       class,
       value,
       stat_id
  FROM v$sysstat
ORDER BY name;

ttitle off

