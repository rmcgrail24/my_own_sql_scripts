ttitle center '***** V$SESSTAT View *****' -
       right 'Page: ' format 999 sql.pno skip 2
 
break on session_sid

SELECT sess.sid session_sid,
       statistic#,
       n.name,
       n.class,
       n.stat_id,
       sess.value
  FROM v$sesstat sess NATURAL JOIN v$statname n
--where sess.sid between 165 and 170
ORDER BY sess.sid, statistic#
--ORDER BY n.stat_id
/
clear breaks
ttitle off

