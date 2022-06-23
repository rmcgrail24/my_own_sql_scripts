column begin_interval_time format a25
column end_interval_time format a25

SELECT begin_interval_time,
       end_interval_time,
       snap_id
  FROM dba_hist_snapshot
ORDER BY begin_interval_time;

clear columns

