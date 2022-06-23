column component format a30
column parameter format a30

SELECT component,
       parameter,
       initial_size,
       target_size,
       final_size,
       status,
       start_time,
       end_time
  FROM v$sga_resize_ops;

clear columns;

