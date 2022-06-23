column component format a40
column curr format 999,999.99 hea 'Current Size (M)' 
column min like curr hea 'Minimum Size (M)' 
column max like curr hea 'Maximum Size (M)' 
column user_specified_size hea 'User|Specified|Size'
column last_oper_type hea 'Last|Operation|Type'

SELECT component,
       current_size / (1024*1024) curr,
       min_size / (1024*1024) min,
       max_size / (1024*1024) max,
       user_specified_size,
       granule_size / (1024*1024) "Granule Size (M)",
       last_oper_type
  FROM v$memory_dynamic_components
ORDER BY current_size desc;

clear columns

