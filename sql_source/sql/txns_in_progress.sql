SELECT t.start_time,
       t.used_ublk,
       s.username,
       r.segment_id,
       r.segment_name
  FROM v$transaction t
  JOIN v$session s ON (t.ses_addr=s.saddr)
  JOIN dba_rollback_segs r ON (t.xidusn=r.segment_id);

