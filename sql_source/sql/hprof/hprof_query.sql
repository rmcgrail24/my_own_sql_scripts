SELECT runid,
       run_timestamp,
       total_elapsed_time
  FROM dbmshp_runs
ODER BY runid;

SELECT *
  FROM dbmshp_function_info
ORDER BY runid;

SELECT *
  FROM dbmshp_parent_child_info
ORDER BY runid;

