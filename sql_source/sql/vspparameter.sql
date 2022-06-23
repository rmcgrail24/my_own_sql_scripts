column sid format a30
column name format a30
column value format a30
column ordinal hea "Ordinal"

ttitle center '***** V$SPPARAMETER View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT sid,
       name,
       type,
       value,
       isspecified,
       ordinal
  FROM v$spparameter
ORDER BY isspecified, name;

clear columns
ttitle off

