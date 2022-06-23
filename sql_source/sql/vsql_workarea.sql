column last_execution hea 'Last|Execution'
SELECT sql_id,
       child_number,
       operation_type,
       operation_id,
       policy,
       estimated_optimal_size,
       total_executions,
       last_execution
  FROM v$sql_workarea;

