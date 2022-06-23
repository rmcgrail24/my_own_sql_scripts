column trace_file format a100

SELECT value
  FROM v$diag_info
 WHERE name = 'Default Trace File';

clear columns

