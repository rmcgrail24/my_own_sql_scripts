--column begin_time format a20

--SELECT TO_TIMESTAMP(begin_time, 'dd-MON-yy hh24:mi:ss'),
SELECT begin_time,
       end_time,
       undotsn,
       undoblks,
       txncount,
       maxquerylen,
       maxqueryid,
       nospaceerrcnt,
       activeblks,
       unexpiredblks,
       expiredblks
  FROM v$undostat;

