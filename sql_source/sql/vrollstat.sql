SELECT usn,
       latch,
       extents,
       rssize,
       writes,
       xacts,
       gets,
       waits,
       status,
       curext,
       curblk
  FROM v$rollstat
ORDER BY usn;

