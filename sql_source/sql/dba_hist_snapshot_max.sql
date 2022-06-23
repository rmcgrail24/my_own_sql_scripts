column min_begin format a25 hea 'Minimum Begin|Interval Time'
column max_begin format a25 hea 'Maximum Begin|Interval Time'

SELECT MIN(begin_interval_time) min_begin,
       MAX(begin_interval_time) max_begin,
       COUNT(snap_id)
  FROM dba_hist_snapshot;

clear columns

