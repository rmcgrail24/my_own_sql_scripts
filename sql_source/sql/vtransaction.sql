column name format a40
column noundo format a6 hea NOUNDO

SELECT xid,
--       name,
       start_time,
       start_scnb,
       start_scn,
       ses_addr,
       ubafil,
       ubablk,
       ubasqn,
       ubarec,
       noundo,
       status "TXN Status"
--     xidsqn "Seq. #"
  FROM v$transaction;

clear columns;

