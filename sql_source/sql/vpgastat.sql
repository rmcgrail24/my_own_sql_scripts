--repheader page center 'PROGRAM GLOBAL AREA'
ttitle center '***** V$PGASTAT View *****' -
       right 'Page: ' format 99 sql.pno skip 2

column value format 999,999,999

SELECT name,
       value,
       unit
  FROM v$pgastat
 WHERE name IN ('maximum PGA allocated', 'total PGA allocated');

clear columns
ttitle off

