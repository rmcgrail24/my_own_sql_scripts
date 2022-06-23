column uga format a30 hea 'Current UGA Memory'

ttitle center '***** Viewing Memory Use for Each User Session *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT username,
       TO_CHAR(value, '9,999,999') || ' bytes' uga
  FROM V$SESSION sess JOIN V$SESSTAT stat ON (sess.sid=stat.sid)
                      JOIN V$STATNAME name ON (stat.statistic# = name.statistic#)
 WHERE name.name = 'session uga memory';

clear columns
ttitle off

